require_relative 'model/bowlingGame'
require_relative 'model/scoreboard'

scoreboard = Scoreboard.new
game = BowlingGame.new(scoreboard)

game.play 10
game.play 10
game.play 10
game.play 10
game.play 10
game.play 10
game.play 10
game.play 10
game.play 10

game.play 2
game.play 2
game.play 10
