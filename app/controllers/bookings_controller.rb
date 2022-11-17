class BookingsController < ApplicationController
  before_action :set_booking, only: [:destroy, :edit, :update, :destroy_popup]
  before_action :set_room, only: [:new, :edit, :room_type]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def booking_with_guest
    @booking = Booking.new
    @booking.build_guest
  end

  def create
    @booking = Booking.new(bookings_params)

    if @booking.save
      redirect_to bookings_path, notice: "Booking created successfully."
    else
      render :new
    end
  end

  def room_type
    @booking = if params[:id]
                 Booking.find(params[:id])
               else
                 Booking.new
               end
    @all_rooms = Room.where(room_type: params[:room_type])
    rooms = @rooms.where(id: @all_rooms.ids)
    @rooms = rooms
    @room_type = params[:room_type]
    @guest = params[:guest]
    @booking.build_guest if @guest
  end

  def edit; end

  def update
    if @booking.update(bookings_params)
      redirect_to bookings_path, notice: "Booking updated successfully."
    else
      render :edit
    end
  end

  def destroy_popup
    respond_to do |format|
      format.js
    end
  end

  def destroy
    if @booking.destroy
      redirect_to bookings_path, notice: "Booking destroyed successfully."
    else
      redirect_to bookings_path, alert: "Something went wrong."
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:guest_id, :room_id, :start_date, :end_date, guest_attributes: [:name, :passport_no,
                                                                                                    :phone])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_room
    @room_ids = Booking.where("end_date >= ?", Date.current).pluck(:room_id)
    @rooms = Room.where.not(id: @room_ids).all
  end
end
