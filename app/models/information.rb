class Information
  include Mongoid::Document
  include Mongoid::Timestamps
  field :raw_value, type: Integer
end
