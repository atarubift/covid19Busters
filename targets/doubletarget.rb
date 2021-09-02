class DoubleTarget < Target
  def initialize(x, y, dx, dy, score)
      super
      self.image = Image.load("images/2x_new-modified.png")
  end

  def update(min ,sec)

    self.x += @dx if @stop_place_left > self.x || @stop_place_right < self.x
    self.y += @dy if @stop_place_top > self.y || @stop_place_bottom < self.y 
    self.draw
    
    @time += 1
    self.vanish if @time > 50
    
    if self.vanished?
      if @hitime == 0
        self.class.collection.delete(self)
      elsif Time.now - @hitime < 5.0
        Window.draw_font(440, 10, "×2", @font, color: C_RED)
        remaining_time = 5.0 - (Time.now - @hitime)
        Window.draw_font(500, 10, "#{remaining_time.round(1)}", @font, color: C_RED)
        if Time.now - @hitime >= 5.0
          self.class.collection.delete(self) 
          $double_point = 1
        end
      end
    end
  end

  def hit
    if Input.mouse_push?(M_LBUTTON)
        @hitime = Time.now
        self.vanish
        $double_point = 2
    end
  end
end

class CircleDoubleTarget < CircleTarget
  def initialize(x, y, score)
      super
      self.image = Image.load("images/2x_new-modified.png")
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
      elsif Time.now - @hitime < 5.0
        remaining_time = 5.0 - (Time.now - @hitime)
        Window.draw_font(440, 10, "×2", @font, color: C_RED)
        Window.draw_font(500, 10, "#{remaining_time.round(1)}", @font, color: C_RED)
      end
      
      if Time.now - @hitime >= 5.0
        self.class.collection.delete(self) 
        $double_point = 1
      end
    end
  end

  def hit
    if Input.mouse_push?(M_LBUTTON)
        @hitime = Time.now
        self.vanish
        $double_point = 2
    end
  end
end