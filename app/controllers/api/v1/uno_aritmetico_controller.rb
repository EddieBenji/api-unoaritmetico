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


    first_play = data[0]
    @this_game = Game.new
    @this_game.date_game = first_play['fecha']
    @this_game.device_id = device_id
    @this_game.save!

    current_game = 1
    data.each do |play|

      if play['id_partida']==current_game
        this_play = @this_game.plays.build
        this_play.turn = play['turno'].to_i

        case play['jugador']
          when 'Jugador 1'
            this_play.player = Player::PLAYER_1
          when 'Jugador 2'
            this_play.player = Player::PLAYER_2
          when 'Jugador 3'
            this_play.player = Player::PLAYER_3
          when 'Jugador 4'
            this_play.player = Player::PLAYER_4
          when 'Maquina'
            this_play.player = Player::MACHINE
          else
            this_play.player = nil
        end

        this_play.color = play['color']=='si' ? true : false

        case play['operacion_mazo']
          when 'suma'
            this_play.op_deck = Operation::ADDITION
          when 'resta'
            this_play.op_deck = Operation::SUBTRACTION
          when 'multiplicacion'
            this_play.op_deck = Operation::MULTIPLICATION
          when 'division'
            this_play.op_deck = Operation::DIVISION
          else
            this_play.op_deck = nil
        end

        case play['operacion_jugada']
          when 'suma'
            this_play.op_player = Operation::ADDITION
          when 'resta'
            this_play.op_player = Operation::SUBTRACTION
          when 'multiplicacion'
            this_play.op_player = Operation::MULTIPLICATION
          when 'division'
            this_play.op_player = Operation::DIVISION
          else
            this_play.op_player = nil
        end

        this_play.value = play['valor'].to_i
        this_play.time_taken = play['Tiempo'].to_
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
