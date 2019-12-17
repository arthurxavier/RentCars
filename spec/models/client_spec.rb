require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'validations' do
    subject { FactoryBot.create(:client) }

    it { is_expected.to be_valid }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_presence_of(:cnh) }
    it { is_expected.to validate_presence_of(:birth_date) }
  end
end
