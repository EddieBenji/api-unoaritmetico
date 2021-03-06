class Api::V1::UnoAritmeticoController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def import_games

    # Recibimos y parseamos todos los juegos
    data = JSON.parse(params[:games])

    # Obtenemos el id del dispositivo para prevenir duplicar juegos entre diferentes dispositivos
    device_id = params[:id_dispositivo]

    if data.empty?
      render plain: 'Bd vacia'
      return false
    end

    # puts "ID del dispositivo " + device_id


    # Creamos la primera partida
    @this_game = nil

    # Current game es el id de la partida
    current_game = 0

    data.each do |play|

      if play['id_partida']==current_game
        this_play = @this_game.plays.build

        # Obtenemos el turno
        this_play.turn = play['turno'].to_i

        # Obtenemos que jugador tiro
        this_play.player = play['jugador']

        # Obtenemos si tiro color
        this_play.color = play['color']=='si' ? true : false

        # Obtenemos la operacion del mazo
        case play['operacion_mazo']
          when 'suma'
            this_play.op_deck_id = Operation::ADDITION
          when 'resta'
            this_play.op_deck_id = Operation::SUBTRACTION
          when 'multiplicacion'
            this_play.op_deck_id = Operation::MULTIPLICATION
          when 'division'
            this_play.op_deck_id = Operation::DIVISION
        end

        # Obtenemos la operacion del jugador
        case play['operacion_jugada']
          when 'suma'
            this_play.op_player_id = Operation::ADDITION
          when 'resta'
            this_play.op_player_id = Operation::SUBTRACTION
          when 'multiplicacion'
            this_play.op_player_id = Operation::MULTIPLICATION
          when 'division'
            this_play.op_player_id = Operation::DIVISION
        end

        # Obtenemos el valor de las operaciones
        this_play.value = play['valor'].to_i

        # Obtenemos el tiempo que le llevo hacer el tiro
        this_play.time_taken = play['tiempoTardadoEnMoverCarta'].to_i
        this_play.save!
      else
        # Creamos un nuevo juego en el caso de que cambie el numero de partida del dispositivo
        @this_game = Game.new
        @this_game.date_game = play['fecha']
        @this_game.device_id = device_id
        @this_game.save!
        current_game+=1
        redo
      end

    end

    # Respondemos que se exporto
    respond_to do |format|
      format.html { render plain: 'BD exportada' }
    end
  end
end
