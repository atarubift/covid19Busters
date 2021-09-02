class Cursor < Sprite
    def initialize
        self.image = Image.load("images/player.png")
        f = 4000
        @sound = SoundEffect.new(20, WAVE_TRI) do
          f = f - 120
          [f, 15]
        end
    end

    def move       
        self.x = Input.mouse_pos_x
        self.y = Input.mouse_pos_y 

        Window.draw(self.x, self.y, self.image) 
        
        if Input.mouse_down?(M_LBUTTON) then   
            @sound.play
            @sound.save("images/marupakuri.wav")
        end
        if Input.mouse_down?(M_RBUTTON) then
            Window.draw_font(self.x, self.y, "right", Font.new(32))
        end
    end
end
