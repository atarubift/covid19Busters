require 'dxruby'

require_relative 'cursor'

Window.width = 800
Window.height = 600
Window.bgcolor = [0, 0, 0]

Window.loop do
    cursor = Cursor.new
    cursor.move
end
