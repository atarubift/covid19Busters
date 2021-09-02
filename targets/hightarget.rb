class HighTarget < Target
    def initialize(x, y, dx, dy)
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
        self.class.collection.delete(self) if @time > 50
    end

    def hit
      if Input.mouse_push?(M_LBUTTON)
          self.vanish
          $score += 100
      end
  end
end

class CircleHighTarget < CircleTarget
    def initialize(x, y)
        super
        self.image = Image.load("images/extra_point.png")
    end

    def hit
      if Input.mouse_push?(M_LBUTTON)
          self.vanish
          $score += 100
      end
  end
end