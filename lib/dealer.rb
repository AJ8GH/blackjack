module BlackJack
  class Dealer
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

    def replenish_deck
      self.deck = Deck.new if deck.cards.empty?
    end

    def calculate_score
      self.score = hand.map(&:value).map(&VALUES).sum
      ace_adjust
      score
    end

    def show_score
      "score: #{calculate_score}"
    end

    def blackjack?
      score == 21
    end

    def bust?
      score > 21
    end

    def dealer_stand?
      score >= 17
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
  end
end
