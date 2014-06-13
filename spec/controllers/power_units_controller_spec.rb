require 'spec_helper'

describe PowerUnitsController do
  describe "GET #add_informations" do
    before(:each) do
      @pu = FactoryGirl.create(:power_unit)
    end

    context "with valid attributes" do
      it "add level information to @power_unit" do
        expect(@pu.diesel_informations.empty?).to be_true
        expect(@pu.gpl_informations.empty?).to be_true
        expect(@pu.mixed_informations.empty?).to be_true

        expect(@pu.diesel_alarms.empty?).to be_true
        expect(@pu.gpl_alarms.empty?).to be_true
        expect(@pu.states.empty?).to be_true

        get :add_informations, :id => @pu, :dl => 1, :gl => 2, :ml => 3, :da => 0, :ga => 1, s: 2

        @pu.reload

        expect(@pu.diesel_informations[0].raw_value).to be_eql(1)
        expect(@pu.gpl_informations[0].raw_value).to be_eql(2)
        expect(@pu.mixed_informations[0].raw_value).to be_eql(3)

        expect(@pu.diesel_alarms[0].raw_value).to be_eql(0)
        expect(@pu.gpl_alarms[0].raw_value).to be_eql(1)
        expect(@pu.states[0].raw_value).to be_eql(2)

        response.should redirect_to power_unit_path
      end

      it "add diesel information" do
        p @pu.diesel_informations
      end
      it "add gpl information"
      it "add mixed information"
      it "add diesel alarm"
      it "add gpl alarm"
      it "add state"
      it "redirects to the power units page"
    end
  end
end
