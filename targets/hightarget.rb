class HighTarget < Target
    def initialize(x, y, dx, dy, score)
        super
        self.image = Image.load("images/extra_point.png")
    end

    def update(min ,sec)

        self.x += @dx if @stop_place_left > self.x || @stop_place_right < self.x
        self.y += @dy if @stop_place_top > self.y || @stop_place_bottom < self.y 
        self.draw
        
        #時間経過で消える
        #他の的より消えるのが早い
        @time += 1
        self.vanish if @time > 50
        
        if self.vanished?
          if @hitime == 0
            self.class.collection.delete(self)
          elsif Time.now - @hitime < 0.5
            Window.draw_font(375, 10, "#{sprintf("%+d", @score)}", @font, color: C_BLACK)
          end
      end
    end
end

class CircleHighTarget < CircleTarget
    def initialize(x, y, score)
        super
        self.image = Image.load("images/extra_point.png")
    end

    def update(min ,sec)

        self.x += @dx
        self.y += 2

        @angle += 5
        rad = @angle * (Math::PI / 180)

        self.x = self.x - Math.sin(rad) * @width
        self.y = self.y - Math.cos(rad) * @width
        self.draw
        
        #画面外に出たら消える
        self.class.collection.delete(self) if y > 600 && x > 800
        
        if self.vanished?
          if @hitime == 0
            self.class.collection.delete(self)
          elsif Time.now - @hitime < 0.5
            Window.draw_font(375, 10, "#{sprintf("%+d", @score)}", @font, color: C_BLACK)
          end
        end
    end
end