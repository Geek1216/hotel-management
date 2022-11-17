class Booking < ApplicationRecord

  #================================= Relationships ===================================================================

  belongs_to :guest
  belongs_to :room

  #======================= Callbacks ================================================================================

  before_validation :validate_start_and_end_date

  #================================= Validations ====================================================================

  validates_presence_of :start_date, :end_date

  #================================ Nested Attributes ============================================================

  accepts_nested_attributes_for :guest, allow_destroy: true

  #================================ Methods ======================================================================

  def validate_start_and_end_date
    errors.add(:base, "End date should be in present") if end_date <= Date.current
  end
end
