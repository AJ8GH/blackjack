module BlackJack
  class Deck
    attr_reader :cards
    def initialize
      @cards = []
      build
      shuffle_deck
    end

    def build
      SUITS.each do |suit|
        VALUES.each do |value|
          cards << Card.new(value, suit)
        end
      end
    end

    def shuffle_deck
      @cards = cards.shuffle
    end
  end
end
