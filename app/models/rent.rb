class Rent < ApplicationRecord
  extend Enumerize

  before_save :price

  validates :status, :price, :rent_date, :return_date, presence: true
  validate :date_range

  belongs_to :car
  belongs_to :client

  enumerize :status, in: [:reserved, :rented], default: :reserved

  def rent_days
    return 0 if !return_date || !rent_date
    (return_date - rent_date + 1).to_i
  end

  private

  def price
    self.price = car.price * rent_days
  end

  def date_range
    return false if !rent_date || !return_date
    if return_date < rent_date
        errors.add(:rent_date, 'return_date cannot be earlier of rent_date')
    end
  end
end
