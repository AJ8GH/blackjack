module BlackJack
  class Game
    attr_accessor :player, :dealer, :move, :card, :players

    def initialize(player)
      @player = player
      @dealer = Dealer.new
      @players = [player, dealer]
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

    def show_hand(person)
      puts hand_intro(person)
      puts person.hand.map { |card| card_name(card) }
    end

    def show_dealer_hand
      puts hand_intro(dealer)
      puts card_name(dealer.hand.first)
      puts "* Hidden *".cardify
    end

    def hand_intro(person)
      person.class == Player ? 'Your hand:' : "Dealer:"
    end

    def card_name(card)
      value, suit = [card.value, card.suit].map { |name| convert_card_names(name) }
      suit += ' ' if suit == 'Hearts' || suit == 'Diamonds'
      "#{value} #{sym(card)} #{suit}".cardify
    end

    def sym(card)
      card.suit == :spades ? '♤' :
      card.suit == :hearts ? '♥︎' :
      card.suit == :clubs ? '♧' : '♦︎'
    end

    def convert_card_names(name)
      name.to_s.capitalize
    end

    def run_game
      start_game
      show_dealer_hand
      show_hand(player)
      unless player.blackjack?
        player_game_logic
        show_hand(dealer)
        dealer_game_logic unless dealer.dealer_stand?
      end
      puts win_statement
      end_game
    end

    def player_game_logic
      while true
        hit_or_stand
        if move == :hit
          deal_card_to(player)
          show_hand(player)
          puts player.show_score
          if player.bust?
            puts "Bust, house wins!"; end_game
          elsif player.blackjack?
            break
          end
        elsif move == :stand
          puts player.show_score; break
        end
      end
    end

    def dealer_game_logic
      while true
        deal_card_to(dealer)
        show_hand(dealer)
        puts dealer.show_score
        if dealer.bust?
          puts "Bust, player wins!"; end_game
        elsif dealer.dealer_stand?
          break
        end
      end
    end

    def start_game
      players.each { |person| initial_deal(person) }
      players.each(&:calculate_score)
    end

    def play_again
      puts "Play again? Enter y for yes, return for no:"
      gets.chomp
    end

    def reset_hands
      players.each { |player| player.hand.clear }
    end

    def reset_scores
      players.each { |player| player.score = 0 }
    end

    def end_game
      if play_again == 'y'
        reset_hands; reset_scores; run_game
      else
        exit
      end
    end

    def win_statement
      result == :win && player.blackjack? ? "BlackJack! Player wins!" :
      result == :win ? "Player wins!" :
      result == :lose ? "House wins!" : "Push, no winner"
    end

    def result
      player_score, dealer_score = players.map(&:score)
      player_score > dealer_score ? :win :
      player_score < dealer_score ? :lose : :push
    end
  end
end
