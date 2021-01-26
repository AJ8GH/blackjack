module BlackJack
  describe Game do
    subject (:game) { Game.new(Player.new) }

    context '#initalize' do
      it 'creates new game' do
        expect { Game.new(Player.new) }.to_not raise_error
      end
    end

    context '#Player' do
      it 'returns player' do
        expect(game.player.class).to eq Player
      end
    end

    context '#dealer' do
      it 'has a dealer on initialization' do
        expect(game.dealer.class).to eq Dealer
      end
    end

    context '#hit_or_stand' do
      it 'gets a move from player' do
        allow_any_instance_of(Object).to receive(:gets) { 'hit' }
        allow_any_instance_of(Object).to receive(:puts) { nil }
        expect(game.hit_or_stand).to eq :hit
      end
    end

    context '#move' do
      it 'stores/returns the move' do
        allow_any_instance_of(Object).to receive(:gets) { 'hit' }
        allow_any_instance_of(Object).to receive(:puts) { nil }
        game.hit_or_stand
        expect(game.move).to eq :hit
      end
    end


  end
end
