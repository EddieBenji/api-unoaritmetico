# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  date_game  :date
#  device_id  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Game < ActiveRecord::Base
  has_many :plays
end
