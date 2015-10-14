# == Schema Information
#
# Table name: players
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class Player < ActiveRecord::Base
  has_one :play
  PLAYER_1 = 1
  PLAYER_2 = 2
  PLAYER_3 = 3
  PLAYER_4 = 4

  MACHINE = 5
end
