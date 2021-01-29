module BlackJack
  describe CardOperations do
    subject (:game) { Game.new(Player.new) }

    let (:ace) { Card.new(:ace, :spades) }
    let (:eight) { Card.new(:eight, :clubs) }
    let (:ten) { Card.new(:ten, :hearts) }
    let (:five) { Card.new(:five, :diamonds) }

    let (:player_hand) { ["\nYour hand:\n ------------------\n| Eight ♧ Clubs",
                          "    |\n ------------------\n ------------------\n",
                          "| Ace ♤ Spades     |\n ------------------\n"].join }
    let (:dealer_hand) { ["Dealer:\n ------------------\n| Eight ♧ Clubs    |",
                          "\n ------------------\n ------------------\n| * Hidden",
                          " *       |\n ------------------\n"].join }
    let (:ace_output) { " ------------------\n| Ace ♤ Spades     |\n ------------------" }

    context '#assign_card' do
      it 'puts card in player hand' do
        game.send(:get_card)
        allow_any_instance_of(Game).to receive(:assign_card) { game.player.hand << game.card }
        game.assign_card(game.player)
        expect(game.player.hand.first).to eq game.card
      end

      it 'puts a card in dealer hand' do
        game.send(:get_card)
        allow_any_instance_of(Game).to receive(:assign_card) { game.dealer.hand << game.card }
        game.assign_card(game.dealer)
        expect(game.dealer.hand.first).to eq game.card
      end
    end

    context '#get_card' do
      it 'gets card from dealer' do
        expect(game.send(:get_card).class).to eq Card
      end
    end

    context '#initial_deal' do
      it 'deals 2 cards to the player' do
        allow_any_instance_of(Game).to receive(:initial_deal) { game.player.hand << ace << ten }
        game.initial_deal(game.player)
        expect(game.player.hand.count).to eq 2
      end

      it 'deals 2 cards to the dealer' do
        allow_any_instance_of(Game).to receive(:initial_deal) { game.dealer.hand << ace << ten }
        game.initial_deal(game.dealer)
        expect(game.dealer.hand.count).to eq 2
      end
    end

    context '#show_hand' do
      it 'shows persons hand' do
        game.player.hand << eight << ace
        allow_any_instance_of(Game).to receive(:show_hand) { puts player_hand }
        expect { game.show_hand(game.player) }.to output(player_hand).to_stdout
      end
    end

    context '#show_dealer_hand' do
      it 'shows the first card only' do
        game.dealer.hand << eight << ace
        allow_any_instance_of(Game).to receive(:show_dealer_hand) { puts dealer_hand }
        expect { game.show_dealer_hand }.to output(dealer_hand).to_stdout
      end
    end

    context '#deal_card_to' do
      it 'gets card and puts it in player hand' do
        allow_any_instance_of(Game).to receive(:deal_card_to) { game.player.hand << game.card }
        game.deal_card_to(game.player)
        expect(game.player.hand.count).to eq 1
      end
    end

    context '#hand_intro' do
      it 'returns correct intro fro player hand' do
        allow_any_instance_of(Game).to receive(:hand_intro) { "\nYour hand:" }
        expect(game.hand_intro(game.player)).to eq "\nYour hand:"
      end
    end

    context '#card_name' do
      it 'converts card symbols to full string name' do
        allow_any_instance_of(Game).to receive(:card_name) { ace_output }
        expect(game.card_name(ace)).to eq ace_output
      end
    end

    context '#suit_symbol' do
      it 'returns correct suit symbols' do
        allow_any_instance_of(Game).to receive(:suit_symbol).and_return(*%w[♤ ♧ ♥︎ ♦︎])
        expect(game.suit_symbol(ace)).to eq '♤'
        expect(game.suit_symbol(eight)).to eq '♧'
        expect(game.suit_symbol(ten)).to eq '♥︎'
        expect(game.suit_symbol(five)).to eq '♦︎'
      end
    end
  end
end
