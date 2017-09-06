# == Schema Information
#
# Table name: companies
#
#  id           :integer          not null, primary key
#  name         :string
#  Introduction :text
#  logo         :string
#  address      :string
#  culture      :text
#  main         :string
#  qr_code      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Company < ApplicationRecord
end
