module BlackJack
  class Dealer
    attr_accessor :hand

    def initialize
      @hand = []
    end

    def hit_or_stick
      move = gets.chomp
    end
  end
end
