module BlackJack
  describe Game do
    subject (:game) { Game.new(Player.new) }
    let (:ace) { Card.new(:ace, :spades) }
    let (:eight) { Card.new(:eight, :clubs) }
    let (:player_hand) { "Your hand:\nEight of Clubs\nAce of Spades\n\n" }
    let (:dealer_hand) { "Dealer:\nEight of Clubs\n*Hidden*\n\n"}

    context '#initalize' do
      it 'creates new game' do
        expect { Game.new(Player.new) }.to_not raise_error
      end
    end

    context '#Player' do
      it 'takes player as argument' do
        expect(game.player.class).to eq Player
      end
    end

    context '#dealer' do
      it 'has a dealer on initialization' do
        expect(game.dealer.class).to eq Dealer
      end
    end

    context '#hit_or_stick' do
      it 'gets a move from player' do
        allow_any_instance_of(Object).to receive(:gets) { 'hit' }
        expect(game.hit_or_stick).to eq :hit
      end
    end

    context '#move' do
      it 'stores/returns the move' do
        allow_any_instance_of(Object).to receive(:gets) { 'hit' }
        game.hit_or_stick
        expect(game.move).to eq :hit
      end
    end

    context '#get_card' do
      it 'gets card from dealer' do
        expect(game.get_card.class).to eq Card
      end
    end

    context '#assign_card' do
      it 'puts card in player hand' do
        game.get_card
        game.assign_card(game.player)
        expect(game.player.hand.first).to eq game.card
      end

      it 'puts a card in dealer hand' do
        game.get_card
        game.assign_card(game.dealer)
        expect(game.dealer.hand.first).to eq game.card
      end
    end

    context '#initial_deal' do
      it 'deals 2 cards to the player' do
        game.initial_deal(game.player)
        expect(game.player.hand.count).to eq 2
      end

      it 'deals 2 cards to the dealer' do
        game.initial_deal(game.dealer)
        expect(game.dealer.hand.count).to eq 2
      end
    end

    context '#card_name' do
      it 'converts card symbols to string name' do
        expect(game.card_name(ace)).to eq "Ace of Spades"
      end
    end

    context '#show_hand' do
      it 'shows persons hand' do
        game.player.hand << eight << ace
        expect { game.show_hand(game.player) }.to output(player_hand).to_stdout
      end
    end

    context '#show_dealer_hand' do
      it 'shows the first card only' do
        game.dealer.hand << eight << ace
        expect { game.show_dealer_hand }.to output(dealer_hand).to_stdout
      end
    end
  end
end
