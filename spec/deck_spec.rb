module BlackJack
  describe Deck do
    subject (:deck) { Deck.new }

    context '#initialize' do
      it 'initializes with 52 cards' do
        # expect(deck.cards).to eq 52
      end
    end

    context '#cards' do
      it 'returns the remaining cards in the deck' do
        expect(deck.cards.class).to eq Array
      end
    end

    context '#build' do
      it 'adds cards to the deck' do

      end
    end
  end
end
