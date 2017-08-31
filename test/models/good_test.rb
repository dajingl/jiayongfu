# == Schema Information
#
# Table name: goods
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  body        :text
#  main_photo  :string
#  rank        :integer          default(0)
#  state       :integer          default("show")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class GoodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
