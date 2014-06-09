module Stringable 
  extend ActiveSupport::Concern

  include Informationable

  included do
    field :state, type: String
    STATE_VALUES = {}
  end
end
