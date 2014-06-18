module Levelable 
  extend ActiveSupport::Concern

  include Informationable

  included do
    field :level, type: Integer

    #field :know_term #q
    #field :slope #b
    # FUNCTION to convert 
  end

  module ClassMethods
    def define_state_values know_term, slope
      know_term = know_term
      slope = slope

      define_method :know_term do 
        know_term
      end

      define_method :slope do 
        slope
      end

      define_method 'raw_value=' do |*args1|
        self.level = slope * args1[0].to_i + know_term

        super args1[0]
      end
    end
  end
end
