class State
  include Stringable

  define_state_values({
    '0' => 'stop',
    '1' => 'mix',
    '2' => 'diesel',
  })
end
