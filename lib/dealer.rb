require_relative 'player'

module BlackJack
  class Dealer < Player
    attr_accessor :deck, :hand, :score

    def initialize
      @deck = Deck.new
      @hand = []
      @score = 0
    end

    def deal
      replenish_deck
      deck.cards.delete_at(0)
    end

    def dealer_stand?
      score >= 17
    end

    private

    def replenish_deck
      if deck.cards.empty?
        self.deck = Deck.new
        puts "\n" + "New deck".starify.double_line_break
      end
    end
  end
end
