module BlackJack
  module GameOperations

    def initiate_deal
      puts "⏎ to deal"
      gets
    end

    def reveal_dealer_hand
      puts "⏎ to reveal dealer's hand"
      gets
    end

    def play_again
      puts "⏎ to play again, 'q' to quit"
      gets.chomp.downcase.to_sym
    end

    def start_game
      players.each { |person| initial_deal(person) }
      calculate_scores
    end

    def calculate_scores
      players.each(&:calculate_score)
    end

    def reset_hands
      players.each { |player| player.hand.clear }
    end

    def reset_scores
      players.each { |player| player.score = 0 }
    end

    def end_game
      if play_again == :q
        puts 'Bye, thanks for playing!'.starify
        exit
      else
        reset_hands; reset_scores; run_game
      end
    end

    def result
      player_score, dealer_score = players.map(&:score)
      player_score > dealer_score ? :win :
      player_score < dealer_score ? :lose : :push
    end

    def win_statement
      player.bust? ? "Bust, house wins!" :
      dealer.bust? ? "Bust, player wins!" :
      result == :win ? "Player wins!" :
      result == :lose ? "House wins!" : "Push, no winner"
    end
  end
end
