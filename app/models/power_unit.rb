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

  embeds_many :diesel_informations#,
    #class_name: "LevelInformation", 
    #store_as: 'diesel_informations'

  embeds_many :gpl_informations#,
    #class_name: "LevelInformation", 
    #store_as: 'gpl_informations'

  embeds_many :mixed_informations#,
    #class_name: "LevelInformation", 
    #store_as: 'mixed_informations'

  embeds_many :red_alarms#,
    #class_name: "Alarm", 
    #store_as: 'diesel_alarms'

  embeds_many :gpl_alarms#,
    #class_name: "Alarm", 
    #store_as: 'gpl_alarms'

  embeds_many :states

  accepts_nested_attributes_for :diesel_informations, :gpl_informations, :mixed_informations, :red_alarms, :gpl_alarms, :states
end
