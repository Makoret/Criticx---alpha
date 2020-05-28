class GamesController < ApplicationController
  def index
    @games = Game.all
  end
  def show
    @item = Game.find(params[:id])
  end
  def new
    @game = Game.new
  end
  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end
  def edit
    @game = Game.find(params[:id])
  end
  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to(@game)
    else
      render :edit
    end
  end
  
  private
  
  def game_params
    params.require(:game).permit(:name, :summary, :release_date, :category, :rating, :parent_id)
  end
end
