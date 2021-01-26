module BlackJack
  class Deck
    attr_accessor :cards

    def initialize
      @cards = []
      build
      shuffle_deck
    end

    def build
      SUITS.each do |suit|
        VALUES.each { |value, score| cards << Card.new(value, suit) }
      end
    end

    def shuffle_deck
      3.times { self.cards = cards.shuffle }
    end
  end
end
