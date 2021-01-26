require_relative 'blackjack'

module BlackJack
  player = Player.new
  game = Game.new(player)
  game.run_game
end
