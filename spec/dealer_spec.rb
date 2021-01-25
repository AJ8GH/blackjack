module BlackJack
  describe Dealer do
    subject (:dealer) { Dealer.new }
    let (:king) { Card.new(:king, :hearts) }
    let (:five) { Card.new(:five, :spades) }
    let (:ace) { Card.new(:ace, :hearts) }
    let (:other_ace) { Card.new(:ace, :clubs) }

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

    context '#score' do
      it 'returns 0 for empty hand' do
        expect(dealer.score).to eq 0
      end

      it 'returns 15 for king and 5' do
        dealer.hand << king << five
        expect(dealer.score).to eq 15
      end
    end

    # context '#ace_adjust' do
    #   it 'adjusts ace to 1 if player busts with an ace' do
    #     dealer.hand << king << five << ace
    #     expect(dealer.score).to be 16
    #   end
    # end

    context '#number of aces' do
      it 'counts 0 for empty hand' do
        expect(dealer.number_of_aces).to eq 0
      end

      it 'returns 1 for 1 ace' do
        dealer.hand << ace << five
        expect(dealer.number_of_aces).to eq 1
      end

      it 'returns 2 for 2 aces' do
        dealer.hand << ace << five << other_ace << king
        expect(dealer.number_of_aces).to eq 2
      end
    end
  end
end
