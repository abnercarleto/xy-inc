require 'rails_helper'

RSpec.describe PointOfInterest, type: :model do
  describe 'validations' do
    subject { build :point_of_interest }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:x) }
    it { is_expected.to validate_presence_of(:y) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_numericality_of(:x).is_greater_than_or_equal_to(0).only_integer }
    it { is_expected.to validate_numericality_of(:y).is_greater_than_or_equal_to(0).only_integer }
  end

  describe 'scopes' do
    describe '#x_lteq' do
      let!(:snack_bar) { create :snack_bar_point }
      it { expect(PointOfInterest.x_lteq(30)).to be_present }
      it { expect(PointOfInterest.x_lteq(20)).to be_blank }
    end

    describe '#x_gteq' do
      let!(:gas_station) { create :gas_station_point }
      it { expect(PointOfInterest.x_gteq(22)).to be_present }
      it { expect(PointOfInterest.x_gteq(35)).to be_blank }
    end

    describe '#y_lteq' do
      let!(:jewelry) { create :jewelry_point }
      it { expect(PointOfInterest.y_lteq(18)).to be_present }
      it { expect(PointOfInterest.y_lteq(10)).to be_blank }
    end

    describe '#y_gteq' do
      let!(:floriculture) { create :floriculture_point }
      it { expect(PointOfInterest.y_gteq(15)).to be_present }
      it { expect(PointOfInterest.y_gteq(25)).to be_blank }
    end

    describe '#x_closeness' do
      let!(:pub) { create :pub_point }
      let!(:floriculture) { create :floriculture_point }
      let!(:steakhouse) { create :steakhouse_point }
      subject { PointOfInterest.x_closeness(15, 5) }
      it { is_expected.to include pub }
      it { is_expected.to include floriculture }
      it { is_expected.not_to include steakhouse }
    end

    describe '#y_closeness' do
      let!(:supermarket) { create :supermarket_point }
      let!(:jewelry) { create :jewelry_point }
      let!(:gas_station) { create :gas_station_point }
      subject { PointOfInterest.y_closeness(10, 6) }
      it { is_expected.to include supermarket }
      it { is_expected.to include jewelry }
      it { is_expected.not_to include gas_station }
    end

    describe '#closeness' do
      let!(:snack_bar) { create :snack_bar_point }
      let!(:gas_station) { create :gas_station_point }
      let!(:jewelry) { create :jewelry_point }
      let!(:floriculture) { create :floriculture_point }
      let!(:pub) { create :pub_point }
      let!(:supermarket) { create :supermarket_point }
      let!(:steakhouse) { create :steakhouse_point }
      subject { PointOfInterest.closeness(20, 10, 10) }
      it { is_expected.to include snack_bar }
      it { is_expected.to include jewelry }
      it { is_expected.to include pub }
      it { is_expected.to include supermarket }
      it { is_expected.to include steakhouse }
      it { is_expected.not_to include gas_station }
      it { is_expected.not_to include floriculture }
    end
  end
end
