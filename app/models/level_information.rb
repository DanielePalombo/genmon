class LevelInformation < Information
  field :level, type: Integer

  embedded_in :power_unit
end
