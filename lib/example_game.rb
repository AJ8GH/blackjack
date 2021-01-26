require_relative 'blackjack'

module BlackJack
  player = Player.new
  game = Game.new(player)
  dealer = game.dealer
  players = [player, dealer]

  game.run_game
end
