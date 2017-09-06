# == Schema Information
#
# Table name: posters
#
#  id         :integer          not null, primary key
#  title      :string
#  main_photo :string
#  rank       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Poster < ApplicationRecord
end
