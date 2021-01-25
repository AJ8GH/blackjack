module BlackJack
  class Game
    attr_accessor :dealer, :deck

    def initialize
      @dealer = Dealer.new
      @deck = Deck.new
    end

    def hit_or_stick
      gets.chomp.downcase.to_sym
    end
  end
end
