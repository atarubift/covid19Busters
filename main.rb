require 'dxruby'
require_relative 'target.rb'

Window.width = 800
Window.height = 600
Window.bgcolor = [0, 0, 0]

targets = []
targets << Target.new(200,100)
targets << Target.new(500,100)
targets << Target.new(200,300)
targets << Target.new(500,300)

Window.loop do

    targets.each do |target|
        target.update
        target.draw
    end
end
