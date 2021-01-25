module BlackJack
  describe Player do
    subject (:player) { Player.new }
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
  end
end
