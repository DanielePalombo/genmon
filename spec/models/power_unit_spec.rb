require "spec_helper"

describe PowerUnit do
  it { should have_field(:diesel_enabled).of_type(Mongoid::Boolean).with_default_value_of(true) }
  it { should have_field(:gpl_enabled)   .of_type(Mongoid::Boolean).with_default_value_of(true) }
  it { should have_field(:mixed_enabled) .of_type(Mongoid::Boolean).with_default_value_of(true) }

  it { should validate_presence_of(:diesel_enabled) }
  it { should validate_presence_of(:gpl_enabled) }
  it { should validate_presence_of(:mixed_enabled) }

  it { should validate_presence_of(:code) }
  it { should validate_uniqueness_of(:code).case_insensitive }

  it { should validate_presence_of(:diesel_mixed_set) }

  it "Allow mixed value only from 30 to 100" do
    power_unit = FactoryGirl.build(:power_unit)
    expect(power_unit).to be_valid

    power_unit.diesel_mixed_set = 101
    expect(power_unit).not_to be_valid
    power_unit.diesel_mixed_set = 100
    expect(power_unit).to be_valid

    power_unit.diesel_mixed_set = 29 
    expect(power_unit).not_to be_valid
    power_unit.diesel_mixed_set = 30 
    expect(power_unit).to be_valid
  end
end
