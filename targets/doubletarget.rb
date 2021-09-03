class DoubleTarget < HighTarget
  def initialize(x, y, dx, dy, score)
      super
      self.image = Image.load("images/2x_new-modified.png")
      @sound = Sound.new("sounds/double.wav")
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
      @sound.play
      @hitime = Time.now
      self.vanish
      $double_flag = 1
      $double_time = Time.now
      puts($double_flag, $double_time)   
    end
  end
end

class CircleDoubleTarget < CircleTarget
  def initialize(x, y, score)
    super
    self.image = Image.load("images/2x_new-modified.png")
    @sound = Sound.new("sounds/double.wav")
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
   
  def hit
    if Input.mouse_push?(M_LBUTTON)
        @sound.play
        @hitime = Time.now
        self.vanish
        $double_flag = 1
        $double_time = Time.now
        puts($double_flag, $double_time)   
    end
  end
end