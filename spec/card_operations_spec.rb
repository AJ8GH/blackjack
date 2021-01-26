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

    context '#get_card' do
      it 'gets card from dealer' do
        expect(game.get_card.class).to eq Card
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

    context '#deal_card_to' do
      it 'gets card and puts it in player hand' do
        game.deal_card_to(game.player)
        expect(game.player.hand.count).to eq 1
      end
    end

    context '#hand_intro' do
      it 'returns correct intro fro player hand' do
        expect(game.hand_intro(game.player)).to eq "\nYour hand:"
      end
    end

    context '#card_name' do
      it 'converts card symbols to full string name' do
        expect(game.card_name(ace)).to eq ace_output
      end
    end

    context '#suit_symbol' do
      it 'returns correct suit symbols' do
        expect(game.suit_symbol(ace)).to eq '♤'
        expect(game.suit_symbol(eight)).to eq '♧'
        expect(game.suit_symbol(ten)).to eq '♥︎'
        expect(game.suit_symbol(five)).to eq '♦︎'
      end
    end

    context '#convert_card_names' do
      it 'converts symbol to capitalized string' do
        expect(game.convert_card_names(:spades)).to eq 'Spades'
        expect(game.convert_card_names(:six)).to eq 'Six'
      end
    end
  end
end
