class State
  include Stringable

  define_state_values({
    0 => 'mix',
    1 => 'stop',
    2 => 'diesel',
  })
end
