class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @cat = Cat.find(params[:cat_id])

    @sum_stars_angriness = @booking.cat.angriness_level
    @sum_no_stars_angriness = 5 - @sum_stars_angriness

    @sum_stars_fluffiness = @booking.cat.fluffiness
    @sum_no_stars_fluffiness = 5 - @sum_stars_fluffiness
  end

  def new
    @cat = Cat.find(params[:cat_id])
    @booking = Booking.new
    @start_date = params[:booking]["start_date"]
    @end_date = params[:booking]["end_date"]

    @sum_stars_angriness = @cat.angriness_level
    @sum_no_stars_angriness = 5 - @sum_stars_angriness

    @sum_stars_fluffiness = @cat.fluffiness
    @sum_no_stars_fluffiness = 5 - @sum_stars_fluffiness
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @cat = Cat.find(params[:cat_id])
    @booking.cat = @cat

    if @booking.save!
      redirect_to dashboard_path(@cat, @booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
