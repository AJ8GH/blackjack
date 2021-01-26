module BlackJack
  describe GameOperations do
    subject (:game) { Game.new(Player.new) }
    let (:ace) { Card.new(:ace, :spades) }
    let (:eight) { Card.new(:eight, :clubs) }
    let (:ten) { Card.new(:ten, :hearts) }
    let (:five) { Card.new(:five, :diamonds) }
    let (:end_output) { 'Bye, thanks for playing!'.starify }

    context '#initiate_deal' do
      it 'outputs expected statement' do
        allow_any_instance_of(Object).to receive(:gets) { "\n" }
        expect { game.initiate_deal }.to output("⏎ to deal\n").to_stdout
      end
    end

    context '#play_again' do
      it 'returns symbol of input' do
        allow(STDOUT).to receive(:puts) { nil }
        allow_any_instance_of(Object).to receive(:gets) { 'q' }
        expect(game.play_again).to eq :q
      end
    end

    context '#reveal_dealer_hand' do
      it 'outputs expected statement' do
        allow_any_instance_of(Object).to receive(:gets) { "\n" }
        expect { game.reveal_dealer_hand }.to output("⏎ to reveal dealer's hand\n").to_stdout
      end
    end

    context '#reset_hands' do
      it 'empties both hands' do
        game.player.hand << ace << ten << five
        game.dealer.hand << ace << ten << five
        game.reset_hands
        expect(game.player.hand.empty?).to be true
        expect(game.dealer.hand.empty?).to be true
      end
    end

    context '#reset_scores' do
      it 'resets both scores to 0' do
        game.player.hand << ace << ten << five
        game.dealer.hand << ace << ten << five
        game.players.each(&:calculate_score)
        game.reset_scores
        expect(game.player.score.zero? && game.dealer.score.zero?).to be true
      end
    end

    context '#result' do
      it 'returns win if player wins' do
        game.dealer.hand << ten << eight
        game.player.hand << ten << ace
        game.players.each(&:calculate_score)
        expect(game.result).to eq :win
      end
    end

    context '#win_statement' do
      it 'returns push statement when push' do
        game.player.hand << ace << ten << five
        game.dealer.hand << ace << ten << five
        game.players.each(&:calculate_score)
        expect(game.win_statement).to eq "Push, no winner"
      end

      it 'returns bust statement when player busts' do
        game.player.hand << eight << ten << five
        game.player.calculate_score
        expect(game.win_statement).to eq "Bust, house wins!"
      end

      it 'returns lose statement when player loses' do
        game.player.hand << ten << five
        game.dealer.hand << ace << ten << eight
        game.players.each(&:calculate_score)
        expect(game.win_statement).to eq "House wins!"
      end
    end

    context '#start_game' do
      it 'deals 2 cards to each player' do
        game.start_game
        expect(game.player.hand.count).to eq 2
        expect(game.dealer.hand.count).to eq 2
      end
    end

    context '#calculate_scores' do
      it 'calculates both scores' do
        game.player.hand << ten << eight
        game.dealer.hand << ten << five
        game.calculate_scores
        expect(game.player.score).to eq 18
        expect(game.dealer.score).to eq 15
      end
    end

    context '#end_game' do
      it 'ends the game when player inputs q' do
        allow_any_instance_of(Object).to receive(:gets) { 'q' }
        expect { game.end_game }.to raise_error(SystemExit)
      end
    end
  end
end
