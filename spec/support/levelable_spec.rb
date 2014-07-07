shared_examples_for "levelable" do
  let(:model) { described_class } # the class that includes the concern

  it 'return correct percentage' do
    model_instance = FactoryGirl.build(model.to_s.underscore.to_sym)

    model_instance.raw_value = 0
    expect(model_instance.to_percentage).to be_eql(0)

    model_instance.raw_value = 65535 
    expect(model_instance.to_percentage).to be_eql(100)

    model_instance.raw_value = 32768 
    expect(model_instance.to_percentage).to be_eql(50)
  end

  it 'check mapping' do
    model_instance = FactoryGirl.build(model.to_s.underscore.to_sym)

    know_term = 1 
    slope = 1 

    alarm_hash_state = {
      0 => 1,
      '2' => 3,
      65535 => 65536 
    }

    alarm_hash_state.each do |raw_value, level|
      p "#{raw_value} => #{level}"

      model_instance.raw_value = raw_value
      expect(model_instance.level).to be_eql(level)
    end
  end
end
