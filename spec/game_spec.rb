module BlackJack
  describe Game do
    context '#initalize' do
      it 'creates new game' do
        expect { Game.new }.to_not raise_error
      end
    end
  end
end
