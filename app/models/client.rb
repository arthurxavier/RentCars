class Client < ApplicationRecord
  validates :name, :cpf, :cnh, :birth_date, presence: true
  validates :name, length: { maximum: 80 }
  validates :cpf, length: { is: 11 }
  validates :cnh, length: { maximum: 11 }
  validate :is_adult

  has_many :rents, dependent: :destroy

  private

  def is_adult
    return false unless birth_date
    if birth_date.year > (Date.today.year-18)
      errors.add(:birth_date, 'You should be over 18 years old.')
    end
  end
end
