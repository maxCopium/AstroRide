class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @spaceship = Spaceship.find(params[:spaceship_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.total = calc_total
    @spaceship = Spaceship.find(params[:spaceship_id])
    @booking.spaceship = @spaceship
    @booking.user = current_user
    if @booking.save
      redirect_to spaceships_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def calc_total
    @spaceship = Spaceship.find(params[:spaceship_id])
    @start_date = Date.strptime(params[:booking][:start_date], '%Y-%m-%d')
    @end_date = Date.strptime(params[:booking][:end_date], '%Y-%m-%d')
    @days = @end_date - @start_date
    total = @spaceship.price * @days
    return total
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
