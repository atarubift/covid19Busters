class DoubleTarget < HighTarget
    def initialize(x, y, dx, dy, score)
        super
        self.image = Image.load("images/2x_new-modified.png")
        @doubleSound = Sound.new("sounds/double.wav")
    end

    def update(min ,sec)

        self.x += @dx if @stop_place_left > self.x || @stop_place_right < self.x
        self.y += @dy if @stop_place_top > self.y || @stop_place_bottom < self.y 
        self.draw
        
        #時間経過で消える
        #他の的より消えるのが早い
        @time += 1
        self.class.collection.delete(self) if @time > 300
        
        if self.vanished?
          if Time.now - @hitime < 0.5
            Window.draw_font(375, 10, "#{sprintf("%+d", @score)}", @font, color: C_BLACK)
          end
      end
    end

    def hit
      if Input.mouse_push?(M_LBUTTON)
          @doubleSound.play
          @hitime = Time.now
          self.vanish
          $double_flag = 1
          $double_time = Time.now
          puts($double_flag, $double_time)   
      end
  end
end
