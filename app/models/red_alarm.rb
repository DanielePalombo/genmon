class RedAlarm 
  include Stringable

  define_state_values({
    '0' => 'no alarm',
    '1' => 'diesel pump pow',
    '2' => 'diesel no fuel',
    '3' => 'diesel pump timeout',
    '4' => 'diesel pump fail',
    '5' => 'mix sensor disconnected',
  })

end
