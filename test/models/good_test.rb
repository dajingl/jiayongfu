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
#

require 'test_helper'

class GoodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
