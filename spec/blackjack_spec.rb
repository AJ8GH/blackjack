module BlackJack
  describe Card do
    subject (:card) { Card.new(:ace, :spades) }

    it 'can create new card objects' do
      expect(Card.new.class).to eq Card
    end

    context '#value' do
      it 'returns the card value' do
        expect(card.value).to eq :ace
      end
    end

    context '#suit' do
      it 'returns the card suit' do
        expect(card.suit).to eq :spades
      end
    end
  end
end
