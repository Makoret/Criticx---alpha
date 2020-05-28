class GamesController < ApplicationController
  def index
    @games = Game.all
  end
  def show
    @item = Game.find(params[:id])
  end
end
