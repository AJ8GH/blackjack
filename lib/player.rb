module BlackJack
  class Player < Dealer
    attr_accessor :hand

    def initialize
      @hand = []
    end

    def score
      hand.map(&:value).map(&VALUES).sum
    end
  end
end
