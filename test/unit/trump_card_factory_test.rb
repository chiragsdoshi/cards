require File.dirname(__FILE__) + '/../test_helper.rb'


Expectations do

  factory = TrumpCardFactory.new({:weight => :higher_wins, :runs => :higher_wins, :rank => :lower_wins})

  expect 'TrumpCard: Rank => 2, Runs => 1000, Weight => 10' do
    factory.create_card({:weight => 10, :runs => 1000, :rank => 2}).to_s
  end

  expect "TrumpCard: Rank => 2, Runs => , Weight => " do
    factory.create_card({:rank => 2}).to_s
  end

  expect "TrumpCard:Tendulkar Rank => , Runs => , Weight => " do
    factory.create_card({}, 'Tendulkar').to_s
  end

end