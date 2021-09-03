class Cursor < Sprite
    def initialize
        self.image = Image.load("images/shooter.png")
        f = 4000
        @sound = Sound.new("sounds/shoot.wav")
    end

    def move       
        self.x = Input.mouse_pos_x - 25
        self.y = Input.mouse_pos_y - 20

        Window.draw(self.x, self.y, self.image) 
        
        if Input.mouse_push?(M_LBUTTON) then   
            @sound.play
        end
    end
end
