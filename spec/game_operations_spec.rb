module BlackJack
  describe GameOperations do
    subject (:game) { Game.new(Player.new) }

    context '#initiate_deal' do
      it 'outputs expected statement' do
        allow_any_instance_of(Object).to receive(:gets) { "\n" }
        expect { game.initiate_deal }.to output("⏎ to deal\n").to_stdout
      end
    end

    context '#play_again' do
      it 'returns symbol of input' do
        allow(STDOUT).to receive(:puts) { nil }
        allow_any_instance_of(Object).to receive(:gets) { 'q' }
        expect(game.play_again).to eq :q
      end
    end
  end
end
