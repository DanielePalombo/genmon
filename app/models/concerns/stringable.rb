module Stringable 
  extend ActiveSupport::Concern

  include Informationable

  included do
    field :state, type: String
  end

  module ClassMethods
    def define_state_values args1
      hash = args1

      define_method :hash_setted do 
        hash
      end

      define_method 'raw_value=' do |*args1|
        unless hash[args1[0]].nil?
          self.state = hash[args1[0].to_s] 
        end
        super args1[0]
      end
    end
  end
end
