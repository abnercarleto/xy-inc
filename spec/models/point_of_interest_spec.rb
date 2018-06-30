require 'rails_helper'

RSpec.describe PointOfInterest, type: :model do
  describe 'validations' do
    subject { build :point_of_interest }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:x) }
    it { is_expected.to validate_presence_of(:y) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
