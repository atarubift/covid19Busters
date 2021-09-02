class Cursor < Sprite
    def initialize
        self.image = Image.load("images/player.png")
    end
    def move       
        self.x = Input.mouse_pos_x
        self.y = Input.mouse_pos_y 

        Window.draw(self.x, self.y, self.image) 
    end
end
