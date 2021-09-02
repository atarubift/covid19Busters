class HighTarget < Target

    def update(min,sec)
        @time += 1
        self.x += @dx if @stop_place_left > self.x || @stop_place_right < self.x
        self.y += @dy if @stop_place_top > self.y || @stop_place_bottom < self.y
        self.class.collection.delete(self) if @time > 50
        
        if self.vanished?
          if Time.now - @hitime < 0.5
            Window.draw_font(375, 10, "#{sprintf("%+d", @score)}", @font, color: C_BLACK)
          end
      end
    end

    def hit
      if Input.mouse_push?(M_LBUTTON)
          @hitime = Time.now
          self.vanish
          $score += @score
      end
  end

end