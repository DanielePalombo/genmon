# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :state do
    power_unit { FactoryGirl.build(:power_unit) }
  end

end
