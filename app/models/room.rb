class Room < ApplicationRecord

  #======================== Validations ===============================================================================

  validates_presence_of :room_type, :room_no
  validates_uniqueness_of :room_no

  #========================== Enum ===================================================================================

  enum room_type: ["One BHK", "Two BHK", "Three BHK"]

  #========================== Relationships ==========================================================================

  has_many :bookings, dependent: :destroy

  #======================= Methods ===================================================================================

  def name
    room_no
  end
end
