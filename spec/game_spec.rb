module BlackJack
  describe Game do
    subject (:game) { Game.new }
    context '#initalize' do
      it 'creates new game' do
        expect { Game.new }.to_not raise_error
      end
    end

    context '#dealer' do
      it 'has a dealer on initialization' do
        expect(game.dealer.class).to eq Dealer
      end
    end

    context '#deck' do
      it 'has a deck on initialization' do
        expect(game.deck.class).to eq Deck
      end
    end

    context '#hit_or_stick' do
      it 'gets a move from player' do
        allow_any_instance_of(Object).to receive(:gets) { 'hit' }
        expect(game.hit_or_stick).to eq :hit
      end
    end

    context '#move' do
      it 'stores/returns the move' do
        allow_any_instance_of(Object).to receive(:gets) { 'hit' }
        game.hit_or_stick
        expect(game.move).to eq :hit
      end
    end
  end
end
