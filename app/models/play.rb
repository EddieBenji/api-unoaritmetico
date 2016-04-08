# == Schema Information
#
# Table name: plays
#
#  id           :integer          not null, primary key
#  game_id      :integer
#  turn         :integer
#  player       :string(255)
#  color        :boolean
#  op_deck_id   :integer
#  op_player_id :integer
#  value        :integer
#  time_taken   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Play < ActiveRecord::Base
  belongs_to :game
  belongs_to :op_deck, class_name: 'Operation'
  belongs_to :op_player, class_name: 'Operation'

end
