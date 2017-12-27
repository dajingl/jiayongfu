# == Schema Information
#
# Table name: offers
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text(65535)
#  age         :string(255)
#  Salary      :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :integer
#

class Offer < ApplicationRecord
  belongs_to :company
end
