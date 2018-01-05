# == Schema Information
#
# Table name: companies
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  Introduction :text(65535)
#  logo         :string(255)
#  address      :string(255)
#  culture      :text(65535)
#  main         :string(255)
#  qr_code      :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Company < ApplicationRecord
  has_many :goods
  has_many :offers
  has_many :posters

  before_save :normalize_culture , :normalize_Introduction

  def normalize_culture
    sanitizer = Rails::Html::WhiteListSanitizer.new
    allowed_tags = %w(br p div span ul ol li h2 h3 b strong img figure audio figcaption)
    allowed_attributes = %w(id src width height controls autoplay class)

    sanitized_content = sanitizer.sanitize((self.culture || '').tr("\\\r\\\n", '').gsub('<p></p>', '').gsub("\n", '').gsub(/<div class="medium-insert-buttons".*?div>/, ''), tags: allowed_tags, attributes: allowed_attributes)
    sanitized_content = '' if sanitized_content == '<p><br></p>'
    self.culture = sanitized_content
  end

  def normalize_Introduction
    sanitizer = Rails::Html::WhiteListSanitizer.new
    allowed_tags = %w(br p div span ul ol li h2 h3 b strong img figure audio figcaption)
    allowed_attributes = %w(id src width height controls autoplay class)

    sanitized_content = sanitizer.sanitize((self.Introduction || '').tr("\\\r\\\n", '').gsub('<p></p>', '').gsub("\n", '').gsub(/<div class="medium-insert-buttons".*?div>/, ''), tags: allowed_tags, attributes: allowed_attributes)
    sanitized_content = '' if sanitized_content == '<p><br></p>'
    self.Introduction = sanitized_content
  end
end
