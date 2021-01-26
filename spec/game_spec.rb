module BlackJack
  describe Game do
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

    context '#hit_or_stand' do
      it 'gets a move from player' do
        allow_any_instance_of(Object).to receive(:gets) { 'hit' }
        allow_any_instance_of(Object).to receive(:puts) { nil }
        expect(game.hit_or_stand).to eq :hit
      end
    end

    context '#move' do
      it 'stores/returns the move' do
        allow_any_instance_of(Object).to receive(:gets) { 'hit' }
        allow_any_instance_of(Object).to receive(:puts) { nil }
        game.hit_or_stand
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
        expect(game.card_name(ace)).to eq ace_output
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

    # context '#player_game_logic' do
    #   it 'calls hit_or_stand if score < 21' do
    #     allow_any_instance_of(Game).to receive(:gets) { 'hit' }
    #     allow_any_instance_of(Object).to receive(:puts) { nil }
    #     player = game.player
    #     player.hand << eight << ten
    #     player.calculate_score
    #     game.player_game_logic
    #     expect(game.move).to eq :hit
    #   end
    # end

    context '#deal_card_to' do
      it 'gets card and puts it in player hand' do
        game.deal_card_to(game.player)
        expect(game.player.hand.count).to eq 1
      end
    end

    context '#reset_hands' do
      it 'empties both hands' do
        game.player.hand << ace << ten << five
        game.dealer.hand << ace << ten << five
        game.reset_hands
        expect(game.player.hand.empty?).to be true
        expect(game.dealer.hand.empty?).to be true
      end
    end

    context '#reset_scores' do
      it 'resets both scores to 0' do
        game.player.hand << ace << ten << five
        game.dealer.hand << ace << ten << five
        game.players.each(&:calculate_score)
        game.reset_scores
        expect(game.player.score.zero? && game.dealer.score.zero?).to be true
      end
    end

    context '#result' do
      it 'returns win if player wins' do
        game.dealer.hand << ten << eight
        game.player.hand << ten << ace
        game.players.each(&:calculate_score)
        expect(game.result).to eq :win
      end
    end
  end
end
