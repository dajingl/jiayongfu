class QiNiuFileInput < Formtastic::Inputs::StringInput
  def cdn_lg_img(key)
    "#{APP_CONFIG['qiniu']['base_url']}#{key}#{APP_CONFIG['qiniu']['preview_lg_size']}"
  end

  def to_html
    input_wrapping do
      label_html <<
      template.content_tag('div', '', class: 'qiniu-file-input-container') do
        template.content_tag('div', class: 'preview') do
          image_key = object.send(method)
          image_key.present? ? template.image_tag(cdn_lg_img(image_key)) : ''
        end <<
        template.tag('input', type: 'file', data: {token: QiniuToken.generate}) <<
        builder.hidden_field(method, input_html_options.merge(class: input_html_options[:class] ? input_html_options[:class] + ' original-input' : 'original-input'))
      end
    end
  end
end