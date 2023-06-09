class SpaceshipsController < ApplicationController
  def index
    @spaceships = Spaceship.all
    if params[:query].present?
      @spaceships = Spaceship.search_by_name_location_and_category(params[:query])
    else
      @spaceships = Spaceship.all
    end
  end

  def show
    @spaceship = Spaceship.find(params[:id])

    @markers = [
      {
        lat:@spaceship.latitude,
        lng: @spaceship.longitude,
        marker_html: render_to_string(partial: "marker")
    }]
    @booking = Booking.new
  end

  def new
    @spaceship = Spaceship.new
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

  def edit
    @spaceship = Spaceship.find(params[:id])
  end

  def update
    @spaceship = Spaceship.find(params[:id])
    @spaceship.update(spaceship_params)
    redirect_to spaceship_path(@spaceship)
  end

  def destroy
    @spaceship = Spaceship.find(params[:id])
    if current_user == @spaceship.user
      @spaceship.destroy
      redirect_to profile_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :category, :location, :price, photos: [])
  end
end
