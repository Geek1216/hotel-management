class GuestsController < ApplicationController
  before_action :set_guest, only: [:edit, :destroy, :update, :destroy_popup]

  def index
    @guests = Guest.all
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guests_params)

    if @guest.save
      redirect_to guests_path, notice: "Guest created successfully."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @guest.update(guests_params)
      redirect_to guests_path, notice: "Guest updated successfully."
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
    if @guest.destroy
      redirect_to guests_path, notice: "Guest destroyed successfully."
    else
      redirect_to guests_path, alert: "Something went wrong."
    end
  end

  private

  def guests_params
    params.require(:guest).permit(:name, :phone, :passport_no)
  end

  def set_guest
    @guest = Guest.find(params[:id])
  end
end
