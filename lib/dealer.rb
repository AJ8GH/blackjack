module BlackJack
  class Dealer
    attr_accessor :deck, :hand, :score

    def initialize
      @deck = Deck.new
      @hand = []
      @score = 0
    end

    def calculate_score
      self.score = hand.map(&:value).map(&VALUES).sum
    end

    def ace_adjust
      if score > 21
        number_of_aces.times do
          self.score -= 10
          break if score <= 21
        end
      end
    end

    def number_of_aces
      hand.map(&:value).count(:ace)
    end

    def deal
      replenish_deck
      deck.cards.delete_at(0)
    end

    def replenish_deck
      self.deck = Deck.new if deck.cards.empty?
    end
  end
end
