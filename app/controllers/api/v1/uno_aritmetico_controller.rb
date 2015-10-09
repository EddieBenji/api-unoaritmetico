class Api::V1::UnoAritmeticoController < ApplicationController

  skip_before_filter :verify_authenticity_token


  def importdb

    play = Play.new
    play.turn = params[:turno]
    play.player = params[:jugador]
    play.color = params[:color]
    play.op_deck = params[:operacionMazo]
    play.op_player = params[:operacionJugada]
    play.value = params[:valor]

    play.save!

    respond_to do |format|
      format.html { render plain: 'Agregado' }
    end
  end

end
