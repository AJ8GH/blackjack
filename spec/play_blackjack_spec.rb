module BlackJack
  describe '#begin_game' do
    it 'creates a new game' do
      expect { begin_game(Player.new) }.to_not raise_error
    end
  end
end
