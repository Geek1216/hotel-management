class AddColumnGuestIdToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :guest
  end
end
