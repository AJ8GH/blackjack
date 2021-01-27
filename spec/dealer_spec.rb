module BlackJack
  describe Dealer do
    subject (:dealer) { Dealer.new }
    let (:king) { Card.new(:king, :hearts) }
    let (:ace) { Card.new(:ace, :hearts) }
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

    context '#replenish_deck' do
      it 'creates new deck if deck is empty' do
        allow(STDOUT).to receive(:puts) { nil }
        dealer.deck.cards.clear
        dealer.replenish_deck
        expect(dealer.deck.cards.count).to eq 52
      end

      it 'does nothing if deck is not empty' do
        allow(STDOUT).to receive(:puts) { nil }
        dealer.deck.cards.clear
        dealer.deck.cards << ace
        dealer.replenish_deck
        expect(dealer.deck.cards.count).to eq 1
      end
    end

    context '#dealer_stand?' do
      it 'returns true when dealer score >= 17' do
        dealer.hand << eight << king
        dealer.calculate_score
        expect(dealer.dealer_stand?).to be true
      end
    end
  end
end
