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
      number_if_aces = score > 21

    end
  end
end
