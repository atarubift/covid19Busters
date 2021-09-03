class HighTarget < Target
    def initialize(x, y, dx, dy, score)
        super
        self.image = Image.load("images/extra_point.png")
        @sound = Sound.new("sounds/vanishTarget.wav")
    end

    def update(min ,sec)

        self.x += @dx if @stop_place_left > self.x || @stop_place_right < self.x
        self.y += @dy if @stop_place_top > self.y || @stop_place_bottom < self.y 
        self.draw
        
        #時間経過で消える
        #他の的より消えるのが早い
        @time += 1
        self.class.collection.delete(self) if @time > 50
        
        if self.vanished?
            if Time.now - @hitime < 0.5
              if $double_flag == 0
                Window.draw_font(375, 10, "#{sprintf("%+d", @score)}", @font, color: C_BLACK)
              else
                Window.draw_font(375, 10, "#{sprintf("%+d", @score*2)}", @font, color: C_BLACK)
              end
            end
        end
    end
end

class CircleHighTarget < CircleTarget
    def initialize(x, y, score)
        super
        self.image = Image.load("images/extra_point.png")
        @sound = Sound.new("sounds/vanishTarget.wav")
    end
end