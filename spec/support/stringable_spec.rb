shared_examples_for "stringable" do
  let(:model) { described_class } # the class that includes the concern

  it 'check mapping' do
    model_instance = FactoryGirl.build(model.to_s.underscore.to_sym)

    alarm_hash_state = {
      '0' => 'no alarm',
      '1' => 'pump no power',
      '2' => 'no fuel',
      '3' => 'pump timeout',
      '4' => 'pump on fail'
    }

    model_instance.hash_setted.each do |raw_value, state|
      p "#{raw_value} => #{state}"

      model_instance.raw_value = raw_value
      expect(model_instance.state).to be_eql(state)
    end

    #diesel_alarm.raw_value = 1
    #expect(diesel_alarm.state).to be_eql('no alarm')

    #diesel_alarm.raw_value = 2
    #expect(diesel_alarm.state).to be_eql('no alarm')

    #diesel_alarm.raw_value = 3
    #expect(diesel_alarm.state).to be_eql('no alarm')

    #diesel_alarm.raw_value = 4
    #expect(diesel_alarm.state).to be_eql('no alarm')
  end
end
