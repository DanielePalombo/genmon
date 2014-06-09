module Levelable 
  extend ActiveSupport::Concern

  include Informationable

  included do
    field :level, type: Integer
    # FUNCTION to convert 
  end
end
