module BlackJack
  describe Player do
    subject (:player) { Player.new }
    let (:jack) { Card.new(:jack, :hearts) }
    let (:ten)  { Card.new(:ten, :clubs) }
    let (:eight) { Card.new(:eight, :diamonds) }
    let (:three) { Card.new(:three, :spades)}
    let (:five) { Card.new(:five, :spades) }
    let (:ace) { Card.new(:ace, :hearts) }
    let (:other_ace) { Card.new(:ace, :clubs) }

    context '#initalize' do
      it 'creates new Player object' do
        expect { Player.new }.to_not raise_error
      end
    end

    context '#hand' do
      it 'returns the player hand' do
        expect(player.hand).to eq []
      end
    end

    context '#score' do
      it 'returns 0 for empty hand' do
        expect(player.score).to eq 0
      end
    end

    context '#calculate_score' do
      it 'returns 20 for jack, ten' do
        player.hand << jack << ten
        expect(player.calculate_score).to eq 20
      end

      it 'updates the score' do
        player.hand << jack << ten
        player.calculate_score
        expect(player.score).to eq 20
      end
    end

    context '#bust?' do
      it 'returns true when bust' do
        player.hand << jack << eight << five
        player.calculate_score
        expect(player.bust?).to be true
      end

      it 'returns false when not bust' do
        player.hand << eight << jack
        player.calculate_score
        expect(player.bust?).to be false
      end
    end

    context '#twenty_one?' do
      it 'returns true when player has 21 but not blackjack' do
        player.hand << three << ten << eight
        player.calculate_score
        expect(player.twenty_one?).to be true
      end
    end

    context '#blackjack' do
      it 'returns true if player has blackjack' do
        player.hand << ace << jack
        player.calculate_score
        expect(player.blackjack?).to be true
      end

      it 'returns false if no blackjack' do
        player.hand << ace << eight
        player.calculate_score
        expect(player.blackjack?).to be false
      end
    end

    context '#calculate_score' do
      it 'calculates 15 for jack and 5' do
        player.hand << jack << five
        expect(player.calculate_score).to eq 15
      end

      it 'updates the score' do
        player.hand << jack << five
        player.calculate_score
        expect(player.score).to eq 15
      end
    end

    context '#ace_adjust' do
      it 'subtracts 10 from score if player busts with one ace' do
        player.hand << jack << five << ace
        player.calculate_score
        player.ace_adjust
        expect(player.score).to eq 16
      end

      it 'subtracts 20 from hand if player busts with 2 aces' do
        player.hand << ace << other_ace << jack << five
        player.calculate_score
        player.ace_adjust
        expect(player.score).to eq 17
      end

      it 'does nothing if no aces in hand' do
        player.hand << jack << five
        player.calculate_score
        player.ace_adjust
        expect(player.score).to eq 15
      end

      it 'subtracts 10 if the hand is 2 aces only' do
        player.hand << ace << other_ace
        player.calculate_score
        player.ace_adjust
        expect(player.score).to eq 12
      end

      it 'does nothing if score is 21' do
        player.hand << ace << jack
        player.calculate_score
        player.ace_adjust
        expect(player.score).to eq 21
      end

      it 'subtracts 10 if the hand is 2 aces and an eight' do
        player.hand << ace << other_ace << eight
        player.calculate_score
        player.ace_adjust
        expect(player.score).to eq 20
      end
    end

    context '#number of aces' do
      it 'counts 0 for empty hand' do
        expect(player.number_of_aces).to eq 0
      end

      it 'returns 1 for 1 ace' do
        player.hand << ace << five
        expect(player.number_of_aces).to eq 1
      end

      it 'returns 2 for 2 aces' do
        player.hand << ace << five << other_ace << jack
        expect(player.number_of_aces).to eq 2
      end
    end

    context '#show_score' do
      it 'returns score: score' do
        player.hand << ten << jack
        expect(player.show_score).to eq "score: 20\n\n"
      end
    end
  end
end
