module BlackJack
  class Game
    attr_accessor :player, :dealer, :move, :card

    def initialize(player)
      @player = player
      @dealer = Dealer.new
      @move = nil
      @card = nil
    end

    def hit_or_stand
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

    def show_hand(person)
      puts hand_intro(person)
      puts person.hand.map { |card| card_name(card) }
      puts
    end

    def show_dealer_hand
      puts hand_intro(dealer)
      puts card_name(dealer.hand.first)
      puts "*Hidden*\n\n"
    end

    def hand_intro(person)
      person.class == Player ? 'Your hand:' : "Dealer:"
    end

    def card_name(card)
      value, suit = [card.value, card.suit].map { |name| convert_names(name) }
      "#{value} of #{suit}"
    end

    def convert_names(name)
      name.to_s.capitalize
    end

    def player_game_logic
      unless player.score == 21
        hit_or_stand
      end
    end
  end
end
