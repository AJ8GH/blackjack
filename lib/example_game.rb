require_relative 'blackjack'

module BlackJack
  player = Player.new
  game = Game.new(player)
  dealer = game.dealer
  players = [player, dealer]

  players.each { |person| game.initial_deal(person) }

  game.show_dealer_hand
  game.show_hand(player)
end
