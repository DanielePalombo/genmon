class DieselAlarm 
  include Stringable

  define_state_values({
    0 => 'no alarm',
    1 => 'pump no power',
    2 => 'no fuel',
    3 => 'pump timeout',
    4 => 'pump on fail'
  })

end
