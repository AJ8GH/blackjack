require_relative 'blackjack'

module BlackJack
  player = Player.new
  game = Game.new(player)
  puts game.game_welcome
  game.run_game
end
