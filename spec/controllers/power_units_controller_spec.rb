require 'spec_helper'

describe PowerUnitsController do
  describe "GET #add_informations" do
    before(:each) do
      @pu = FactoryGirl.create(:power_unit)
    end

    context "with valid attributes" do
      it "located the requested @power_unit" do
        #put :update, id: @contact, contact: Factory.attributes_for(:contact)
        get :add_informations, :id => @pu, :dl => 1, :gl => 2, :ml => 3
        p @pu.diesel_informations
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
