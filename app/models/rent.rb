class Rent < ApplicationRecord
  extend Enumerize

  before_save :set_price, :not_rented_car?

  validates :status, :price, :rent_date, :return_date, presence: true
  validate :date_range

  belongs_to :car
  belongs_to :client

  enumerize :status, in: [:reserved, :rented], default: :reserved

  def rent_days
    return 0 if !return_date || !rent_date
    (return_date - rent_date + 1).to_i
  end

  def rented_car?
    Rent.where(car_id: self.car_id)
        .where('? > rent_date AND ? < return_date',return_date, return_date)
        .or(Rent.where(car_id: self.car_id).where('? > rent_date AND ? < return_date',rent_date, rent_date))
  end

  def not_rented_car?
    !rented_car?
  end

  private

  def set_price
    self.price = car.price * rent_days
  end

  def date_range
    return false if !rent_date || !return_date
    if return_date < rent_date
        errors.add(:rent_date, 'return_date cannot be earlier of rent_date')
    end

    if (return_date - rent_date).to_i > 30
        errors.add(:return_date, 'date range cannot be most that 30 days')
    end

    if (return_date - rent_date).to_i < 7
      errors.add(:return_date, 'date range cannot be less than 7 days')
    end
  end
end
