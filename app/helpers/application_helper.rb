module ApplicationHelper
  def page_name
    original_page_name = "#{params[:controller]}-page".gsub('/','-')
    dashed_page_name = original_page_name.gsub('_', '-')

    [original_page_name, dashed_page_name, params[:action]].join(' ')
  end

  def cdn_video(key)
    "#{APP_CONFIG['qiniu']['base_url']}#{key}"
  end

  def cdn_img(key, size = 100)
    image_size_config = case size
                          when 0..100
                            APP_CONFIG['qiniu']['preview_size']
                          when 101..200
                            APP_CONFIG['qiniu']['preview_md_size']
                          when 201..600
                            APP_CONFIG['qiniu']['preview_lg_size']
                          else
                            ''
                        end
    "#{APP_CONFIG['qiniu']['base_url']}#{key}#{image_size_config}"
  end

  def cdn_md_img(key)
    "#{APP_CONFIG['qiniu']['base_url']}#{key}#{APP_CONFIG['qiniu']['preview_md_size']}"
  end

  def cdn_lg_img(key)
    "#{APP_CONFIG['qiniu']['base_url']}#{key}#{APP_CONFIG['qiniu']['preview_lg_size']}"
  end

  def cdn_thumb_img(key)
    "#{APP_CONFIG['qiniu']['base_url']}#{key}#{APP_CONFIG['qiniu']['preview_thumbnail_size']}"
  end

  def cdn_original_img(key)
    "#{APP_CONFIG['qiniu']['base_url']}#{key}"
  end

  def background_img_tag(url_key, options = {})
    tag_options = options
    if options[:class].present?
      tag_options[:class] = "background-img-tag #{options[:class]}"
    else
      tag_options[:class] = 'background-img-tag'
    end

    url = nil
    if url_key.present?
      url = cdn_img(url_key, options[:size] || options[:width])
    elsif options[:placeholder_img].present?
      url = asset_path(options[:placeholder_img])
      tag_options[:class] = "#{tag_options[:class]} placeholder-img"
    else
      tag_options[:class] = "#{tag_options[:class]} placeholder"
    end
    styles = {}
    styles['background-image'] = "url(#{url})" if url.present?
    if options[:size].present?
      styles['width'] = "#{options[:size]}px"
      styles['height'] = "#{options[:size]}px"
    end

    if options[:width].present? && options[:height].present?
      styles['width'] = "#{options[:width]}px"
      styles['height'] = "#{options[:height]}px"
    end

    tag_options = tag_options.merge({style: styles.map { |k, v| "#{k}:#{v}" }.join(';')}) unless styles.empty?
    content_tag(:span, '', tag_options)
  end

  def article_link_to(article, html_options = nil, &block)
    path = ''
    extra_opts = {}
    if article.photo?
      path = photo_article_path article
      extra_opts = {target: '_blank'}
    elsif article.video?
      path = video_article_path article
      extra_opts = {target: '_blank'}
    else
      path = article_path article
    end

    link_to path, extra_opts.merge(html_options || {}), &block
  end

  def user_login_method
    if params.key?(:use_password_login)
      return 'password_login'
    end

    if params.dig(:user, :password).present?
      return 'password_login'
    end

    'fast_login'
  end


  def distance_of_time(from_time, to_time = DateTime.now, options = {})
    options = {
        scope: :'datetime.distance_in_words.short'
    }.merge!(options)

    from_time = from_time.to_time if from_time.respond_to?(:to_time)
    to_time = to_time.to_time if to_time.respond_to?(:to_time)
    from_time, to_time = to_time, from_time if from_time > to_time
    distance_in_minutes = ((to_time - from_time)/60.0).round

    I18n.with_options :locale => options[:locale], :scope => options[:scope] do |locale|
      case distance_in_minutes
        when 0..1 then locale.t :just_now
        when 1...60           then locale.t :x_minutes,      :count => distance_in_minutes
        # 60 mins up to 24 hours
        when 60...1440        then locale.t :x_hours,  :count => (distance_in_minutes.to_f / 60.0).round
        # 24 hours up to 30 days
        when 1440...43200      then locale.t :x_days,         :count => (distance_in_minutes.to_f / 1440.0).round
        # 30 days up to 365 days
        when 43200...525600    then locale.t :x_months, :count => (distance_in_minutes.to_f / 43200.0).round
        else
          locale.t :before_one_year
      end
    end
  end

  def author_link_to(author, html_options = nil, &block)
    path = ''
    extra_opts = {}
    if author.is_artist?
      path = artist_path author.artist
    elsif author.is_artist_group?
      path = artist_group_path author.artist_group
    else
      path = user_path author
    end

    if block_given?
      link_to path, extra_opts.merge(html_options || {}), &block
    else
      link_to author.display_name, path, extra_opts.merge(html_options || {})
    end
  end

  def mask_number(number, head_number_count = 3, tail_number_count = 4)
    return '' if number.nil?

    matched = number.match(/^(\d{#{head_number_count}})(.*)(\d{#{tail_number_count}})$/)
    return '*' * number.to_s.size if matched.nil?

    matched[1] + '*' * matched[2].size + matched[3]
  end
end
