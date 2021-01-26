# String methods to create card like visual output
class String
  def cardify
    self.pad.edge.red_adjust.border
  end

  def border
    line = ' ' + '-' * 18
    line + self + line
  end

  def red_adjust
    self.slice!(-3) unless self.include?('Hearts') || self.include?('Diamonds')
    self
  end

  def edge
    "\n| " + self + "|\n"
  end

  def pad
    space = 18 - self.length
    self + (' ' * space)
  end
end
