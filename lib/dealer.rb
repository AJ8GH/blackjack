module BlackJack
  class Dealer
    attr_accessor :hand, :score

    def initialize
      @hand = []
      @score = 0
    end

    def calculate_score
      self.score = hand.map(&:value).map(&VALUES).sum
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
  end
end
