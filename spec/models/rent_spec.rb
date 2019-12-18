require 'rails_helper'

RSpec.describe Rent, type: :model do
  describe 'validations' do
    subject { FactoryBot.create(:rent) }

    it { is_expected.to be_valid }

    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:rent_date) }
    it { is_expected.to validate_presence_of(:return_date) }
    it { should belong_to(:client) }
    it { should belong_to(:car) }
  end
end
