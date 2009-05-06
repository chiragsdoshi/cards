require File.dirname(__FILE__) + '/../test_helper.rb'

Expectations do
  one_row_data_source = DataSource.new("#{RAILS_ROOT}/test/fixtures/one_row.csv")
  test_data_source = DataSource.new("#{RAILS_ROOT}/test/fixtures/test.csv")


  expect "TrumpCard:Tendulkar, S R Average => 54.28, Matches => 156, Runs => 12429, Wickets => 42" do
    deck = Deck.new(one_row_data_source)
    deck.draw_one.to_s
  end

  expect 2 do
    deck = Deck.new(test_data_source)
    deck.size
  end

  expect "TrumpCard:Tendulkar, S R Average => 54.28, Matches => 156, Runs => 12429, Wickets => 42" do
    deck = Deck.new(test_data_source)
    deck.find_card_by_name('Tendulkar, S R').to_s
  end

  expect "TrumpCard:Tendulkar, S R Average => 54.28, Matches => 156, Runs => 12429, Wickets => 42" do
    deck = Deck.new(test_data_source)
    deck.draw_one
    deck.draw_one
    deck.find_card_by_name('Tendulkar, S R').to_s
  end

  expect false do
    deck = Deck.new(test_data_source)
    deck.draw_one.eql? deck.draw_one
  end
  
  expect false do
    deck = Deck.new(test_data_source)
    deck.draw_one
    deck.draw_one
    deck.draw_one.nil?
  end

end