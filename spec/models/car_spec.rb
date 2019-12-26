require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'validations' do
    subject { FactoryBot.create(:car) }

    it { is_expected.to be_valid }

    it { is_expected.to validate_presence_of(:model) }
    it { is_expected.to validate_presence_of(:brand) }
    it { is_expected.to validate_presence_of(:manufacture_year) }
    it { is_expected.to validate_presence_of(:model_year) }
    it { is_expected.to validate_presence_of(:transmission) }
    it { is_expected.to validate_presence_of(:color) }
    it { is_expected.to validate_presence_of(:price) }
  end

  describe 'associations' do
    it { should have_one(:rent) }
  end
end