describe String do
  let (:eight) { ' ' + '-' * 18 + "\n| Eight ♧ Clubs |\n" + ' ' + '-' * 18 }
  let (:card) { " ------------------\n| Eight ♧ Clubs    |\n ------------------" }

  context '#dollarfy' do
    it 'adds $$$ to each end of string' do
      expect(''.dollarfy).to eq '$$$  $$$'
    end
  end

  context '#starify' do
    it 'adds *** to each end of string' do
      expect(''.starify).to eq '***  ***'
    end
  end

  context '#double_line_break' do
    it 'adds to line breaks to string' do
      expect(''.double_line_break).to eq "\n\n"
    end
  end

  context '#pad_with_space' do
    it 'pads string with whitespace' do
      expect(''.pad_with_space).to eq ' ' * 18
    end
  end

  context '#card_edge' do
    it 'adds | to each end of string' do
      expect(''.card_edge).to eq "\n| |\n"
    end
  end

  context '#black_suit_adjust' do
    it 'removes the 3rd character from end of black cards' do
      expect("| Eight ♧ Clubs  |\n".black_suit_adjust).to eq "| Eight ♧ Clubs |\n"
    end

    it 'does nothing to red cards' do
      expect("| Six ♦︎ Diamonds |\n".black_suit_adjust).to eq "| Six ♦︎ Diamonds |\n"
    end
  end

  context '#card_border' do
    it 'adds top and bottom border to card' do
      expect("\n| Eight ♧ Clubs |\n".card_border).to eq eight
    end
  end

  context '#cardify' do
    it 'creates card border output' do
      expect("Eight ♧ Clubs".cardify).to eq card
    end
  end
end
