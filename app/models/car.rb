class Car < ApplicationRecord
  extend Enumerize

  validates :brand, :model, :manufacture_year, :model_year, :transmission,
            :color, :price, presence: true
  validates :brand, :model, length: { maximum: 225 }

  has_one :rent, dependent: :destroy

  enumerize :transmission, in: [:manual, :automatic], default: :manual
  enumerize :seats_option, in: [:cloth, :leather], default: :cloth

  def name
    brand + " " + model
  end
end
