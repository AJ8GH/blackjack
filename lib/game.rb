module BlackJack
  class Game
    attr_accessor :player, :dealer, :deck, :move

    def initialize(player)
      @player = player
      @dealer = Dealer.new
      @move = nil
    end

    def hit_or_stick
      self.move = gets.chomp.downcase.to_sym
    end
  end
end
