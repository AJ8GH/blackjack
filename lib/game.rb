module BlackJack
  class Game
    attr_reader :dealer
    
    def initialize
      @dealer = Dealer.new

    end
  end
end

# def hit_or_stick
#   move = gets.chomp
