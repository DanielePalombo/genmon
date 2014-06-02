class PowerUnit
  include Mongoid::Document
  field :code, type: String
  field :diesel_mixed_set, type: Integer, default: 100

  validates :code, 
    :presence => true , 
    :uniqueness => {:case_sensitive => false}

  validates :diesel_mixed_set, 
    :presence => true,
    :numericality => { :greater_than_or_equal_to => 30, :less_than_or_equal_to => 100 }
end
