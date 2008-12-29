require File.dirname(__FILE__) + '/../test_helper.rb'

Expectations do

#  expect true do
#    TrumpCard.new(:rank => 1).wins_with?(TrumpCard.new(:rank => 2), :rank)
#  end
#
#  expect false do
#    TrumpCard.new(:rank => 3).wins_with?(TrumpCard.new(:rank => 2), :rank)
#  end

  expect true do

    weight100 = TrumpCard.new([Property.higher_wins_property(:weight, 100)])
    weight80 = TrumpCard.new([Property.higher_wins_property(:weight, 80)])
    weight100.wins_with?(weight80, :weight)
  end

  expect true do
    runs1000 = TrumpCard.new([Property.higher_wins_property(:runs, 1000)])
    runs800 = TrumpCard.new([Property.higher_wins_property(:runs, 800)])
    runs1000.wins_with?(runs800, :runs)
  end

  expect false do
    weight70 = TrumpCard.new([Property.higher_wins_property(:weight, 70)])
    weight80 = TrumpCard.new([Property.higher_wins_property(:weight, 80)])
    weight70.wins_with?(weight80, :weight)
  end
  
  expect "TrumpCard: Weight => 70, Rank => 1" do
    TrumpCard.new([Property.higher_wins_property(:weight, 70), Property.lower_wins_property(:rank, 1)]).to_s
  end

end