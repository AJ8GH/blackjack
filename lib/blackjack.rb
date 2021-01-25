require_relative 'dealer'
require_relative 'deck'

module BlackJack
  Card = Struct.new(:value, :suit)

  SUITS = [:spades, :hearts, :diamonds, :clubs]

  VALUES = [
    :ace,
    :two,
    :three,
    :four,
    :five,
    :six,
    :seven,
    :eight,
    :nine,
    :ten,
    :jack,
    :queen,
    :king
  ]
end
