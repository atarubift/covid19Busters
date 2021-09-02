require 'dxruby'

require_relative 'game'
require_relative 'cursor'
require_relative 'targets/target'
require_relative 'targets/circletarget'
require_relative 'targets/normaltarget'
require_relative 'targets/hightarget'
require_relative 'targets/minustarget'
require_relative 'targets/doubletarget'

Window.width = 800
Window.height = 600
Window.bgcolor = [0, 0, 0]

Window.loop do
  game = Game.new
  game.run
end
