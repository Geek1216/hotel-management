class Guest < ApplicationRecord
  
  #========================== Validations =============================================================================

  validates_presence_of :name, :phone
  validates_uniqueness_of :passport_no, :phone

  #========================== Relationships ==========================================================================

  has_many :bookings, dependent: :destroy
end
