module BlackJack
  class Player < Dealer
    attr_accessor :hand, :score

    def initialize
      @hand = []
      @score = 0
    end
  end
end
