module BlackJack
  class Game
    attr_accessor :player, :dealer, :move

    def initialize(player)
      @player = player
      @dealer = Dealer.new
      @move = nil
    end

    def hit_or_stick
      self.move = gets.chomp.downcase.to_sym
    end

    def get_card
      dealer.deal
    end
  end
end
