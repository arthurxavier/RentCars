class Rent < ApplicationRecord
  #Validates
  validates :status, :price, :rent_date, :return_date, presence: true
  validate :valid_date_range

  belongs_to :car
  belongs_to :client

  private

  def valid_date_range
    return false if !rent_date || !return_date
    if return_date < rent_date
        errors.add(:birth_date, 'return_date cannot be earlier of rent_date')
    end
  end
end
