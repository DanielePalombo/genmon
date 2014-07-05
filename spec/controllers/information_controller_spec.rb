require 'spec_helper'

describe DieselInformationsController do
  let(:pu) { FactoryGirl.create(:power_unit) }

  describe "GET #index" do
    context "with valid attributes" do
      it "download csv" do
        get :index, power_unit_id: pu, format: :json

      end
    end
  end
end
