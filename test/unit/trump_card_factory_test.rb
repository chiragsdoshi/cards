require File.dirname(__FILE__) + '/../test_helper.rb'


Expectations do

  factory = TrumpCardFactory.new({:weight => :higher_wins, :runs => :higher_wins, :rank => :lower_wins})

  expect 3 do
    factory.create_card({:weight => 10, :runs => 1000, :rank => 2}).properties.size
  end

  expect 3 do
    factory.create_card({:rank => 2}).properties.size
  end

end