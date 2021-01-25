module BlackJack
  class Game
    attr_accessor :player, :dealer, :move, :card

    def initialize(player)
      @player = player
      @dealer = Dealer.new
      @move = nil
      @card = nil
    end

    def hit_or_stick
      self.move = gets.chomp.downcase.to_sym
    end

    def get_card
      self.card = dealer.deal
    end

    def assign_card(person)
      person.hand << card
    end

    def start_game
      Game.new(Player.new)
    end

    def initial_deal(person)
      2.times { get_card; assign_card(person) }
    end
  end
end
