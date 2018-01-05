# == Schema Information
#
# Table name: companies
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  logo         :string(255)
#  address      :string(255)
#  culture      :text(65535)
#  main         :string(255)
#  qr_code      :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  introduction :text(65535)
#

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
