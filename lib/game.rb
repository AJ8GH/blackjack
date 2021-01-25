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

    def initial_deal(person)
      2.times { get_card; assign_card(person) }
    end

    def show_cards
      player_hand = player.hand.map(&:value)
      dealer_hand = dealer.hand.map(&:value)
      puts "Player:\n#{player_hand}\n\nHouse:\n*hidden*\n#{dealer_hand.last}"
    end

    def card_name(card)
      value = convert_names(card.value)
      suit = convert_names(card.suit)
      "#{value} of #{suit}"
    end

    def convert_names(name)
      name.to_s.capitalize
    end
  end
end
