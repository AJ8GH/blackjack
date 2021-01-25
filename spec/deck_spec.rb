module BlackJack
  describe Deck do
    subject (:deck) { Deck.new }

    context '#initialize' do
      it 'initializes with 52 cards' do
        expect(deck.cards.count).to eq 52
      end

      it 'shuffles the deck randomly on initalization' do
        other_deck = Deck.new
        expect(deck.cards).not_to eq other_deck.cards
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

    context '#shuffle_deck' do
      it 'shuffles the deck' do
        deck.cards.clear; deck.build
        cards = deck.cards
        deck.shuffle_deck
        expect(deck.cards).not_to eq cards
      end
    end
  end
end
