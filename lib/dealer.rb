module BlackJack
  class Dealer
    attr_accessor :hand

    def initialize
      @hand = []
    end

    def score
      hand.map(&:value).map(&VALUES).sum
    end

    def ace_adjust
      # score > 21
    end

    def number_of_aces
      hand.map(&:value).count(:ace)
    end
  end
end
