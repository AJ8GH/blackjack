module BlackJack
  class Player
    attr_accessor :hand, :score

    def initialize
      @hand = []
      @score = 0
    end

    def calculate_score
      self.score = hand.map(&:value).map(&VALUES).sum
      ace_adjust
      score
    end

    def show_score
      "score: #{calculate_score}".double_line_break
    end

    def blackjack?
      score == 21 && hand.count == 2
    end

    def twenty_one?
      score == 21
    end

    def bust?
      score > 21
    end

    private

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
