class SpaceshipsController < ApplicationController
  def index
    @spaceships = Spaceship.all
  end

  def new
    @spaceship = Spaceship.new
  end

  def show
    @spaceship = Spaceship.find(params[:id])
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    @spaceship.user = current_user
    if @spaceship.save
      redirect_to spaceship_path(@spaceship)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :category, :location, :price, photos: [])
  end
end
