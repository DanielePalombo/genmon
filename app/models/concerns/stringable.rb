module Stringable 
  extend ActiveSupport::Concern

  include Informationable

  included do
    field :state, type: String

    #define_state_values({
    #  0 => 'no alarm',
    #  1 => 'pump no power',
    #  2 => 'no fuel',
    #  3 => 'pump timeout',
    #  4 => 'pump on fail'
    #})
  end

  module ClassMethods
    def define_state_values args1
      @@hash = args1

      define_method :hash_setted do 
        @@hash
      end

      define_method 'raw_value=' do |*args1|
        unless @@hash[args1[0]].nil?
          self.state = @@hash[args1[0]] 
        end
        super args1[0]
      end
    end


  end

end
