class YellowAlarm 
  include Stringable

  define_state_values({
    '0' => 'no alarm',
    '1' => 'pump no pow',
    '2' => 'no fuel',
    '3' => 'pump timeout',
    '4' => 'pump on fail',
    '5' => 'diesel sensor disconnected',
    '6' => 'gpl sensor disconnected',
  })

end
