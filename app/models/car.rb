class Car < ApplicationRecord
  validates :brand, :model, :manufacture_year, :model_year, :transmission,
            :color, presence: true
  validates :brand, :model, length: { maximum: 225 }

  has_one :rent, dependent: :destroy
end
