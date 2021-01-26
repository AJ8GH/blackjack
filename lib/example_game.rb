require_relative 'blackjack'

module BlackJack
  player = Player.new
  game = Game.new(player)
  players = [player, game.dealer]

  players.each { |person| game.initial_deal(person) }

  game.show_hand(player)
  game.show_hand(dealer)
end
