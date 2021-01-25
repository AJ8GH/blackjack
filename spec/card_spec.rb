module BlackJack
  describe Card do
    it 'can create new card objects' do
      expect(Card.new.class).to eq Card
    end
  end
end
