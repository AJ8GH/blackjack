# String methods to create card like visual output
class String
  def cardify
    self.pad_with_space.card_edge.black_suit_adjust.card_border
  end

  def card_border
    line = ' ' + '-' * 18
    line + self + line
  end

  def black_suit_adjust
    self.slice!(-3) unless self.include?('Hearts') || self.include?('Diamonds')
    self
  end

  def card_edge
    "\n| " + self + "|\n"
  end

  def pad_with_space
    space = 18 - self.length
    self + (' ' * space)
  end

  def double_line_break
    self + "\n\n"
  end

  def starify
    '*** ' + self + ' ***'
  end

  def dollarfy
    '$$$ ' + self + ' $$$'
  end

  def card_suits
    "\n♦︎ ♧ ♥︎ ♤ " + self + ' ♤ ♥︎ ♧ ♦︎'
  end
end
