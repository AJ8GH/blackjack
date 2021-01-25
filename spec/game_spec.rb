module BlackJack
  describe Game do
    subject (:game) { Game.new }
    context '#initalize' do
      it 'creates new game' do
        expect { Game.new }.to_not raise_error
      end
    end

    context '#dealer' do
      it 'Game.new instantiates a dealer' do
        expect(game.dealer.class).to eq Dealer
      end
    end

    # context '#hit_or_stick' do
    #   it 'gets a move from player' do
    #     allow_any_instance_of(Dealer).to receive(:gets) { 'hit' }
    #     expect(hit_or_stick).to eq :hit
    #   end
    # end
  end
end
