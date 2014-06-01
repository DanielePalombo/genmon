class PowerUnit
  include Mongoid::Document
  field :code, type: String

  validates :code, 
    :presence => true , 
    :uniqueness => {:case_sensitive => false}
end
