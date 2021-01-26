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
      puts "Hit or stand?"
      self.move = gets.chomp.downcase.to_sym
    end

    def get_card
      self.card = dealer.deal
    end

    def assign_card(person)
      person.hand << card
    end

    def deal_card_to(person)
      get_card
      assign_card(person)
    end

    def initial_deal(person)
      2.times { get_card; assign_card(person) }
    end

    def score(person)
      "score: #{person.calculate_score}"
    end

    def blackjack?(person)
      person.score == 21
    end

    def bust?(person)
      person.score > 21
    end

    def show_hand(person)
      puts hand_intro(person)
      puts person.hand.map { |card| card_name(card) }
    end

    def show_dealer_hand
      puts hand_intro(dealer)
      puts card_name(dealer.hand.first)
      puts "*Hidden*"
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
      while true
        hit_or_stand
        if move == :hit
          deal_card_to(player)
          show_hand(player)
          puts score(player)
          puts "Bust"; end_game if bust?(player)
          break if blackjack?(player)
        elsif move == :stand
          puts score(player); break
        end
      end
    end

    # def dealer_game_logic
    #   while true
    #
    #     dealer
    #   end
    # end

    def play_again
      puts "Play again? Hit 'y' for yes, any key for no:"
      gets.chomp
    end

    def end_game
      if play_again == 'y'
        run_game
      else
        exit
      end
    end

    def start_game
      players = [game.player, game.dealer]
      players.each { |person| game.initial_deal(person) }
    end

    def run_game
      start_game
      show_hand(player)
      show_dealer_hand
      [player, dealer].each { |person| calculate_score(person) }
      unless blackjack?(player)
        player_game_logic
      end
    end
  end
end
