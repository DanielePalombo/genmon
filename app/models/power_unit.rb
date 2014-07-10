class PowerUnit
  include Mongoid::Document
  field :code, type: String
  field :diesel_mixed_set, type: Integer, default: 100

  field :diesel_enabled, type: Boolean, default: true
  field :gpl_enabled, type: Boolean, default: true
  field :mixed_enabled, type: Boolean, default: true

  validates_presence_of :diesel_enabled, :gpl_enabled, :mixed_enabled

  validates :code, 
    :presence => true , 
    :uniqueness => {:case_sensitive => false}

  validates :diesel_mixed_set, 
    :presence => true,
    :numericality => { :greater_than_or_equal_to => 30, :less_than_or_equal_to => 100 }

  embeds_many :diesel_informations, cascade_callbacks: true#,
    #class_name: "LevelInformation", 
    #store_as: 'diesel_informations'

  embeds_many :gpl_informations, cascade_callbacks: true#,
    #class_name: "LevelInformation", 
    #store_as: 'gpl_informations'

  embeds_many :mixed_informations, cascade_callbacks: true#,
    #class_name: "LevelInformation", 
    #store_as: 'mixed_informations'

  embeds_many :red_alarms, cascade_callbacks: true#,
    #class_name: "Alarm", 
    #store_as: 'diesel_alarms'

  embeds_many :yellow_alarms, cascade_callbacks: true#,
    #class_name: "Alarm", 
    #store_as: 'yellow_alarms'

  embeds_many :states, cascade_callbacks: true

  accepts_nested_attributes_for :diesel_informations, :gpl_informations, :mixed_informations, :red_alarms, :yellow_alarms, :states, :autosave => true
end
