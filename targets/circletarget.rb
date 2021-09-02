class CircleTarget < Target
    #初期のx座標、y座標
    def initialize(x, y)
        self.x = x
        self.y = y
        @time = 0
        @width = 7 #半径
        @angle = 0 #角度

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
        
        #時間経過で消える
        @time += 1
        self.class.collection.delete(self) if @time > 200
    end
end