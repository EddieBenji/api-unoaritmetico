class Api::V1::UnoAritmeticoController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def import_games

    data = JSON.parse(params[:games])
    device_id = params[:id_dispositivo]

    if data.empty?
      render plain: 'Bd vacia'
      return false
    end

    puts "ID del dispositivo " + device_id


    current_game = 0
    @this_game = Game.new

    data.each do |play|

      if play['id_partida']==current_game
        this_play = @this_game.plays.build
        this_play.turn = play['turno']
        this_play.player = play['jugador']
        this_play.color = play['color']
        this_play.op_deck = play['operacion_mazo']
        this_play.op_player = play['operacion_jugada']
        this_play.value = play['valor']
        this_play.save!
      else
        @this_game = Game.new
        @this_game.date_game = play['fecha']
        @this_game.device_id = device_id
        @this_game.save!
        current_game+=1
      end

    end

    respond_to do |format|
      format.html { render plain: "BD exportada" }
    end
  end
end
