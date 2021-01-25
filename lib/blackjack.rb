require_relative 'dealer'
require_relative 'deck'

module BlackJack
  Card = Struct.new(:number, :suit)

  SUITS = [:spades, :hearts, :diamonds, :clubs]

  NUMBERS = [
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
