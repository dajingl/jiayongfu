# == Schema Information
#
# Table name: offers
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  age         :string
#  Salary      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Offer < ApplicationRecord
end
