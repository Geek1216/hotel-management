class RoomsController < ApplicationController
  before_action :set_room, only: [:edit, :update, :destroy, :destroy_popup]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(rooms_params)

    if @room.save
      redirect_to rooms_path, notice: "Room created successfully."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @room.update(rooms_params)
      redirect_to rooms_path, notice: "Room updated successfully."
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
    if @room.destroy
      redirect_to rooms_path, notice: "Room destroyed successfully."
    else
      redirect_to rooms_path, alert: "Something went wrong."
    end
  end

  private

  def rooms_params
    params.require(:room).permit(:room_type, :room_no)
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
