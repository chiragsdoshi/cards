require File.dirname(__FILE__) + '/../test_helper.rb'

Expectations do

  expect true do
    Property.higher_wins_property(nil, 1000) > Property.higher_wins_property(nil, 800)
  end

  expect true do
    Property.higher_wins_property(nil, 1000) >= Property.higher_wins_property(nil, 1000)
  end

  expect true do
    Property.lower_wins_property(nil, 1) > Property.lower_wins_property(nil, 2)
  end

  expect "Rank => 2" do
    Property.lower_wins_property(:rank, 2).to_s
  end
end