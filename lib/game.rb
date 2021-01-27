require_relative 'game_operations'
require_relative 'card_operations'

module BlackJack
  class Game
    include GameOperations
    include CardOperations

    attr_accessor :player, :dealer, :move, :card, :players

    def initialize(player)
      @player = player
      @dealer = Dealer.new
      @players = [player, dealer]
      @move = nil
      @card = nil
    end

    def hit_or_stand
      puts "Hit or stand? (h/s)"
      self.move = gets.chomp.downcase.to_sym
    end

    def run_game
      initial_sequence
      blackjack_logic
      win_logic
      end_game
    end

    def initial_sequence
      initiate_deal
      start_game
      show_dealer_hand
      show_hand_and_score(player)
    end

    def blackjack_logic
      if player.blackjack?
        blackjack_sequence
      else
        player_sequence
      end
    end

    def blackjack_sequence
      puts "BlackJack!"
      reveal_dealer_hand_and_score
    end

    def player_sequence
      player_game_logic
      reveal_dealer_hand_and_score
      dealer_game_logic unless dealer.dealer_stand?
    end

    def player_hit_sequence
      deal_card_to(player)
      show_hand_and_score(player)
    end

    def dealer_hit_sequence
      initiate_deal
      deal_card_to(dealer)
      show_hand_and_score(dealer)
    end

    def show_hand_and_score(person)
      show_hand(person)
      puts person.show_score
    end

    def reveal_dealer_hand_and_score
      reveal_dealer_hand
      show_hand_and_score(dealer)
    end

    def player_game_logic
      while true
        hit_or_stand
        if move == :h
          player_hit_sequence
          if player.bust?
            puts win_statement.starify.double_line_break
            end_game
          elsif player.twenty_one?
            break
          end
        elsif move == :s
          break
        end
      end
    end

    def dealer_game_logic
      while true
        dealer_hit_sequence
        if dealer.bust?
          puts win_statement.dollarfy.double_line_break
          end_game
        elsif dealer.dealer_stand?
          break
        end
      end
    end

    def win_logic
      if result == :win
        puts win_statement.dollarfy.double_line_break
      else
        puts win_statement.starify.double_line_break
      end
    end
  end
end
