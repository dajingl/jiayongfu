# == Schema Information
#
# Table name: goods
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text(65535)
#  body        :text(65535)
#  main_photo  :string(255)
#  rank        :integer          default(0)
#  state       :integer          default("show")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  abstraction :text(65535)
#  company_id  :integer
#

class Good < ApplicationRecord
  belongs_to :company
  before_save :normalize_content
  enum state: { show: 0, hide: 1}

  def normalize_content
    sanitizer = Rails::Html::WhiteListSanitizer.new
    allowed_tags = %w(br p div span ul ol li h2 h3 b strong img figure audio figcaption)
    allowed_attributes = %w(id src width height controls autoplay class)

    sanitized_content = sanitizer.sanitize((self.body || '').tr("\\\r\\\n", '').gsub('<p></p>', '').gsub("\n", '').gsub(/<div class="medium-insert-buttons".*?div>/, ''), tags: allowed_tags, attributes: allowed_attributes)
    sanitized_content = '' if sanitized_content == '<p><br></p>'
    self.body = sanitized_content

    self.abstraction = sanitizer.sanitize(self.body, tags: []).slice(0, 150).strip unless self.abstraction.present?
  end

  def self.test
    p '--------lalal'
  end

  def self.mytest
    p '--------lalal'
  end
end
