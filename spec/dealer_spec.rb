module BlackJack
  describe Dealer do
    subject (:dealer) { Dealer.new }
    let (:king) { Card.new(:king, :hearts) }
    let (:five) { Card.new(:five, :spades) }
    let (:ace) { Card.new(:ace, :hearts) }
    let (:other_ace) { Card.new(:ace, :clubs) }
    let (:eight) { Card.new(:eight, :diamonds) }

    context '#initialize' do
      it 'initializes a new Dealer without arguments' do
        expect{ Dealer.new }.to_not raise_error
      end
    end

    context '#hand' do
      it 'begins game empty' do
        expect(dealer.hand).to eq []
      end
    end

    context '#score' do
      it 'returns the score' do
        expect(dealer.score).to eq 0
      end
    end

    context '#deck' do
      it 'has a deck on initialization' do
        expect(dealer.deck.class).to eq Deck
      end
    end

    context '#calculate_score' do
      it 'calculates 15 for king and 5' do
        dealer.hand << king << five
        expect(dealer.calculate_score).to eq 15
      end

      it 'updates the score' do
        dealer.hand << king << five
        dealer.calculate_score
        expect(dealer.score).to eq 15
      end
    end

    context '#ace_adjust' do
      it 'subtracts 10 from score if dealer busts with one ace' do
        dealer.hand << king << five << ace
        dealer.calculate_score
        dealer.ace_adjust
        expect(dealer.score).to eq 16
      end

      it 'subtracts 20 from hand if dealer busts with 2 aces' do
        dealer.hand << ace << other_ace << king << five
        dealer.calculate_score
        dealer.ace_adjust
        expect(dealer.score).to eq 17
      end

      it 'does nothing if no aces in hand' do
        dealer.hand << king << five
        dealer.calculate_score
        dealer.ace_adjust
        expect(dealer.score).to eq 15
      end

      it 'subtracts 10 if the hand is 2 aces only' do
        dealer.hand << ace << other_ace
        dealer.calculate_score
        dealer.ace_adjust
        expect(dealer.score).to eq 12
      end

      it 'does nothing if score is 21' do
        dealer.hand << ace << king
        dealer.calculate_score
        dealer.ace_adjust
        expect(dealer.score).to eq 21
      end

      it 'subtracts 10 if the hand is 2 aces and an eight' do
        dealer.hand << ace << other_ace << eight
        dealer.calculate_score
        dealer.ace_adjust
        expect(dealer.score).to eq 20
      end
    end

    context '#number of aces' do
      it 'counts 0 for empty hand' do
        expect(dealer.number_of_aces).to eq 0
      end

      it 'returns 1 for 1 ace' do
        dealer.hand << ace << five
        expect(dealer.number_of_aces).to eq 1
      end

      it 'returns 2 for 2 aces' do
        dealer.hand << ace << five << other_ace << king
        expect(dealer.number_of_aces).to eq 2
      end
    end

    context '#deal' do
      it 'returns a card' do
        expect(dealer.deal.class).to eq Card
      end

      it 'removes the card from the deck' do
        dealer.deal
        expect(dealer.deck.cards.count).to eq 51
      end

      it 'removes card from deck each deal' do
        dealer.deal; dealer.deal; dealer.deal
        expect(dealer.deck.cards.count).to eq 49
      end
    end
  end
end
