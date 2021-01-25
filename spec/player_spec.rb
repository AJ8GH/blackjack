module BlackJack
  describe Player do
    context '#initalize' do
      it 'creates new Player object' do
        expect { Player.new }.to_not raise_error
      end
    end
  end
end
