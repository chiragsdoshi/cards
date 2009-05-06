class TrumpCardController < ApplicationController

  def initialize
    @decks = {:tennis => tennis_deck, :test_cricket => test_cricket_deck}
  end

  def index

  end
  
  def play
    deck = @decks[params[:game].to_sym]
    @card1 = deck.draw_one
    @card2 = deck.draw_one
    @property_names = deck.data_source.property_names
    @game = params[:game]
  end

  def result
    deck = @decks[params[:game].to_sym]
    @my_card = deck.find_card_by_name(params[:name])
    if @my_card.nil?
      @result = :invalid
      return
    end
    
    @other_card = deck.find_card_by_name(params[:other_name])
    @result = @my_card.beats?(@other_card, params[:property].to_sym) ?  :wins : :loses
    @property = params[:property]
    @game = params[:game]
  end

  def test_cricket_deck
    Deck.new(DataSource.new("#{RAILS_ROOT}/config/data/test_cricketers.csv"))
  end

  def tennis_deck
    Deck.new(DataSource.new("#{RAILS_ROOT}/config/data/tennis_legends.csv"))
  end

end
