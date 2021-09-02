class CircleTarget < Target
    #初期のx座標、y座標
    def initialize(x, y, score)
        self.x = x
        self.y = y
        @time = 0
        @width = 7 #半径
        @angle = 0 #角度
        @score = score
        @font = Font.new(32)
        @hitime = 0

        x == 0 ? @dx = 3 : @dx = -3

    end

    def update(min, sec)

        self.x += @dx
        self.y += 2

        @angle += 3
        rad = @angle * (Math::PI / 180)

        self.x = self.x - Math.sin(rad) * @width
        self.y = self.y - Math.cos(rad) * @width
        self.draw
        
        #画面外に出たら消える
        self.class.collection.delete(self) if y > 600

        if self.vanished?
            if Time.now - @hitime < 0.5
              Window.draw_font(375, 10, "#{sprintf("%+d", @score)}", @font, color: C_BLACK)
            end
        end
    end
end