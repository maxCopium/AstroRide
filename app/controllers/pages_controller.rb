class PagesController < ApplicationController
  def home
  end

  def profile
    if current_user.nil?
      redirect_to spaceships_path
    else
      @spaceships = current_user.spaceships
    end
  end

  def booking
    @my_spaceships = current_user.spaceships
    @my_bookings = current_user.bookings.joins(:spaceship)
    if current_user.nil?
      redirect_to spaceships_path
    else
      @bookings = current_user.bookings
    end
  end
end
