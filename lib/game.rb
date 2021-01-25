module BlackJack
  class Game
    attr_accessor :dealer, :deck

    def initialize
      @dealer = Dealer.new
      @deck = Deck.new
    end
  end
end

# def hit_or_stick
#   move = gets.chomp
