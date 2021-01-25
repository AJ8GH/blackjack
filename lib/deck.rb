module BlackJack
  class Deck
    attr_reader :cards
    def initialize
      @cards = []
      build
    end

    def build
      SUITS.each do |suit|
        VALUES.each do |value|
          cards << Card.new(suit, value)
        end
      end
    end
  end
end
