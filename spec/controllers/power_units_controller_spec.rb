require 'spec_helper'

shared_examples_for "an information" do
  it "raw_value" do
    expect(information.raw_value).to be_eql(from)
  end

  it "created_at" do
    expect(information.created_at).to_not be_nil
    expect(information.created_at).to be >= @date_min
  end
end

shared_examples_for "a levelable" do
  it_behaves_like "an information"

  it "level" do
    expect(information.level).to be_eql(to)
  end
end

shared_examples_for "a stringable" do
  it_behaves_like "an information"

  it "state" do
    expect(information.state).to be_eql(to)
  end
end

describe PowerUnitsController do
  let(:pu) { FactoryGirl.create(:power_unit) }

  describe "GET #add_informations" do
    context "with valid attributes" do
      before(:each) do
        expect(pu.diesel_informations.empty?).to be_true
        expect(pu.gpl_informations.empty?).to be_true
        expect(pu.mixed_informations.empty?).to be_true

        expect(pu.red_alarms.empty?).to be_true
        expect(pu.yellow_alarms.empty?).to be_true
        expect(pu.states.empty?).to be_true

        @to_compare = {
          1 => 2,
        }

        @date_min = DateTime.now
        put :add_informations, :id => pu, :dl => 1, :gl => 2, :ml => 3, :ra => 0, :ya => 1, s: 2

        pu.reload
      end

      context "diesel information" do
        let(:information) {pu.diesel_informations[0]}
        let(:from) {1}
        let(:to) {2}
        it_behaves_like "a levelable"
      end

      context "gpl information" do
        let(:information) {pu.gpl_informations[0]}
        let(:from) {2}
        let(:to) {3}
        it_behaves_like "a levelable"
      end

      context "mixed information" do
        let(:information) {pu.mixed_informations[0]}
        let(:from) {3}
        let(:to) {4}
        it_behaves_like "a levelable"
      end

      context "red alarm" do
        let(:information) {pu.red_alarms[0]}
        let(:from) {0}
        let(:to) {'no alarm'}
        it_behaves_like "a stringable"
      end

      context "yellow alarm" do
        let(:information) {pu.yellow_alarms[0]}
        let(:from) {1}
        let(:to) {'pump no pow'}
        it_behaves_like "a stringable"
      end

      context "states" do
        let(:information) {pu.states[0]}
        let(:from) {2}
        let(:to) {'diesel'}
        it_behaves_like "a stringable"
      end

      it "return te @power_unit.mixed_set value" do
        pu.diesel_mixed_set = 60
        pu.save

        put :add_informations, :format => :json, :id => pu, :dl => 1, :gl => 2, :ml => 3, :ra => 0, :ya => 1, s: 2
        expect(response.body).to eql({set_mixed_to: 60}.to_json)
      end
    end
  end

  it "select power_unit by code" do
    get :show, :id => pu.code

    expect(response.response_code).to be_eql(200)
  end
end
