require File.dirname(__FILE__) + '/../test_helper.rb'

Expectations do

  expect true do
    rank1 = TrumpCard.new(:rank => Property.lower_wins_property(:rank, 1))
    rank2 = TrumpCard.new(:rank => Property.lower_wins_property(:rank, 2))
    rank1.beats?(rank2, :rank)
  end

  expect false do
    rank1 = TrumpCard.new(:rank => Property.lower_wins_property(:rank, 1))
    rank2 = TrumpCard.new(:rank => Property.lower_wins_property(:rank, 2))
    rank2.beats?(rank1, :rank)
  end

  expect true do
    weight100 = TrumpCard.new(:weight => Property.higher_wins_property(:weight, 100))
    weight80 = TrumpCard.new(:weight => Property.higher_wins_property(:weight, 80))
    weight100.beats?(weight80, :weight)
  end

  expect true do
    runs1000 = TrumpCard.new(:runs => Property.higher_wins_property(:runs, 1000))
    runs800 = TrumpCard.new(:runs => Property.higher_wins_property(:runs, 800))
    runs1000.beats?(runs800, :runs)
  end

  expect true do
    runs1000 = TrumpCard.new(:runs => Property.higher_wins_property(:runs, 1000))
    runs1000_again = TrumpCard.new(:runs => Property.higher_wins_property(:runs, 1000))
    runs1000.beats?(runs1000_again, :runs)
  end

  expect false do
    weight70 = TrumpCard.new(:weight => Property.higher_wins_property(:weight, 70))
    weight80 = TrumpCard.new(:weight => Property.higher_wins_property(:weight, 80))
    weight70.beats?(weight80, :weight)
  end
  
  expect "TrumpCard: Rank => 1, Weight => 70" do
    TrumpCard.new({:weight => Property.higher_wins_property(:weight, 70), :rank => Property.lower_wins_property(:rank, 1)}).to_s
  end

  expect "TrumpCard:Tendlya " do
    TrumpCard.new({}, 'Tendlya').to_s
  end

  expect true do
    TrumpCard.new({}, 'Tendlya').identified_by?('Tendlya')
  end

  expect "Tendlya" do
    TrumpCard.new({}, 'Tendlya').name
  end

end