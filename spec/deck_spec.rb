module BlackJack
  describe Deck do
    subject (:deck) { Deck.new }

    context '#initialize' do
      it 'initializes with 52 cards' do
        expect(deck.cards.count).to eq 52
      end
    end

    context '#cards' do
      it 'returns the remaining cards in the deck' do
        expect(deck.cards.class).to eq Array
      end
    end

    context '#build' do
      it 'adds cards 52 to the deck' do
        deck.build
        expect(deck.cards.count).to eq 104
      end
    end
  end
end
