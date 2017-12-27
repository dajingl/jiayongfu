# == Schema Information
#
# Table name: posters
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  main_photo :string(255)
#  rank       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Poster < ApplicationRecord
  belongs_to :company
end
