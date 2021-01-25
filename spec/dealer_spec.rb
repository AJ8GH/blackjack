describe Dealer do
  context '#initialize' do
    it 'initializes a new Dealer without arguments' do
      expect{ Dealer.new }.to_not raise_error
    end
  end
end
