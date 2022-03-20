class Deck
  NUM_DECKS = 1

  # создание колоды
  def self.set_deck
    @values = %w[A 2 3 4 5 6 7 8 9 10 J Q K]
    @suits = %w[♥ ♠ ♦ ♣]

    deck_of_cards = [] # колода 52 карт
    @values.each { |value| @suits.each { |suit| deck_of_cards << "#{value}#{suit}" } }
    deck_of_cards * NUM_DECKS
  end

end
