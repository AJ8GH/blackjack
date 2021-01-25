module BlackJack
  describe Game do
    subject (:game) { Game.new(Player.new) }

    context '#initalize' do
      it 'creates new game' do
        expect { Game.new(Player.new) }.to_not raise_error
      end
    end

    context '#Player' do
      it 'takes player as argument' do
        expect(game.player.class).to eq Player
      end
    end

    context '#dealer' do
      it 'has a dealer on initialization' do
        expect(game.dealer.class).to eq Dealer
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

    context '#get_card' do
      it 'gets card from dealer' do
        expect(game.get_card.class).to eq Card
      end
    end

    context '#assign_card' do
      it 'puts card in their hand' do
        game.get_card
        game.assign_card(game.player)
        expect(game.player.hand.first).to eq game.card
      end
    end
  end
end
