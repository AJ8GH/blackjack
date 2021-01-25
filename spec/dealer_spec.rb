module BlackJack
  describe Dealer do
    subject (:dealer) { Dealer.new }

    context '#initialize' do
      it 'initializes a new Dealer without arguments' do
        expect{ Dealer.new }.to_not raise_error
      end
    end

    context '#hand' do
      it 'begins game empty' do
        expect(dealer.hand).to eq []
      end
    end

    context '#hit_or_stick' do
      it 'gets a move from player' do
        allow_any_instance_of(Dealer).to receive(:gets) { 'hit' }
        expect(hit_or_stick).to eq :hit
      end
    end
  end
end
