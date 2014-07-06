module Informationable 
  extend ActiveSupport::Concern

  included do
    include Mongoid::Document
    include Mongoid::Timestamps

    embedded_in :power_unit
    field :raw_value, type: Integer
  end
end

