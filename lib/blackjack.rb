require_relative 'dealer'
require_relative 'deck'
require_relative 'player'
require_relative 'game'
require_relative 'core_extensions'
require_relative 'game_operations'
require_relative 'card_operations'

module BlackJack
  Card = Struct.new(:value, :suit)

  SUITS = [:spades, :hearts, :diamonds, :clubs]

  VALUES = {
    ace:    11,
    two:    2,
    three:  3,
    four:   4,
    five:   5,
    six:    6,
    seven:  7,
    eight:  8,
    nine:   9,
    ten:    10,
    jack:   10,
    queen:  10,
    king:   10
  }
end
