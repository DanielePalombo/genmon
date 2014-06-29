require 'spec_helper'

describe PowerUnitsController do
  let(:pu) { FactoryGirl.create(:power_unit) }

  describe "GET #add_informations" do
    context "with valid attributes" do
      it "add level information to @power_unit" do
        expect(pu.diesel_informations.empty?).to be_true
        expect(pu.gpl_informations.empty?).to be_true
        expect(pu.mixed_informations.empty?).to be_true

        expect(pu.red_alarms.empty?).to be_true
        expect(pu.yellow_alarms.empty?).to be_true
        expect(pu.states.empty?).to be_true

        put :add_informations, :id => pu, :dl => 1, :gl => 2, :ml => 3, :ra => 0, :ya => 1, s: 2

        pu.reload

        expect(pu.diesel_informations[0].raw_value).to be_eql(1)
        expect(pu.diesel_informations[0].level).to be_eql(2)

        expect(pu.gpl_informations[0].raw_value).to be_eql(2)
        expect(pu.gpl_informations[0].level).to be_eql(3)

        expect(pu.mixed_informations[0].raw_value).to be_eql(3)
        expect(pu.mixed_informations[0].level).to be_eql(4)

        expect(pu.red_alarms[0].raw_value).to be_eql(0)
        expect(pu.red_alarms[0].state).to be_eql('no alarm')

        expect(pu.yellow_alarms[0].raw_value).to be_eql(1)
        expect(pu.yellow_alarms[0].state).to be_eql('pump no pow')

        expect(pu.states[0].raw_value).to be_eql(2)
        expect(pu.states[0].state).to be_eql('diesel')
      end

      it "return te @power_unit.mixed_set value" do
        pu.diesel_mixed_set = 60
        pu.save

        put :add_informations, :format => :json, :id => pu, :dl => 1, :gl => 2, :ml => 3, :ra => 0, :ya => 1, s: 2
        response.body.should == {set_mixed_to: 60}.to_json
      end
    end
  end

  it "select power_unit by code" do
    get :show, :id => pu.code

    expect(response.response_code).to be_eql(200)
  end
end
