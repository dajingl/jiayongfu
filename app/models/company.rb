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
end
