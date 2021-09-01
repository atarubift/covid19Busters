require 'dxruby'

require_relative 'game'
require_relative 'target'
require_relative 'cursor'

Window.width = 800
Window.height = 600
Window.bgcolor = [0, 0, 0]

Window.loop do
  game = Game.new
  game.run
end
