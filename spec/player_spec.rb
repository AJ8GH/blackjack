module BlackJack
  describe Player do
    subject (:player) { Player.new }
    let (:jack) { Card.new(:jack, :hearts) }
    let (:ten)  { Card.new(:ten, :clubs) }

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

      it 'returns 20 for jack, ten' do
        player.hand << jack << ten
        expect(player.score).to eq 20
      end
    end
  end
end
