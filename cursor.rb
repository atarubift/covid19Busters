class Cursor
    def initialize
        @image = Image.load("images/player.png")
    end
    def move       
        x = Input.mouse_pos_x
        y = Input.mouse_pos_y 

        Window.draw(x, y, @image) 
    end
end
