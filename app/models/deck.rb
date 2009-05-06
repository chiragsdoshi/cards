class Deck

  def initialize(data_source)
    @data_source = data_source
    @cards = []
    @all_cards = data_source.cards
  end

  def data_source
    @data_source  
  end

  def size
    @all_cards.size
  end

  def draw_one
    i = pick_index
    picked = @cards[i]
    @cards.delete_at(i)
    return picked unless picked.nil?

    @cards.concat @all_cards
    draw_one
  end

  def find_card_by_name(name)
    @all_cards.find {|card| card.identified_by?(name)}
  end

  private

  def pick_index
    rand(@cards.size)
  end

end