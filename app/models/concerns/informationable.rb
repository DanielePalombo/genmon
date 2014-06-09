module Informationable 
  extend ActiveSupport::Concern

  include Mongoid::Document
  include Mongoid::Timestamps

  included do
    embedded_in :power_unit
    field :raw_value, type: Integer
  end
end

