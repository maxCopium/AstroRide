class BookingsController < ApplicationController

  def new
    @bookmark.new
  end

  def create

  end

  private

  def calc_total
    daslkd
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, )
  end
end


t.date "start_date"
t.date "end_date"
t.boolean "status"
t.float "total"
t.bigint "user_id", null: false
t.bigint "spaceship_id", null: false
t.datetime "created_at", null: false
t.datetime "updated_at", null: false
t.index ["spaceship_id"], name: "index_bookings_on_spaceship_id"
t.index ["user_id"], name: "index_bookings_on_user_id"
