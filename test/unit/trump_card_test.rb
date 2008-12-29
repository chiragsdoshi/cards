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
    TrumpCard.new(:weight => 100).wins_with?(TrumpCard.new(:weight => 80), :weight)
  end

  expect true do
    TrumpCard.new(:runs => 1000).wins_with?(TrumpCard.new(:runs => 800), :runs)
  end

  expect false do
    TrumpCard.new(:weight => 70).wins_with?(TrumpCard.new(:weight => 80), :weight)
  end
  
end