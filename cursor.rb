class Cursor
    def initialize
        @image = Image.load("images/player.png")
    end
    def move       
        x = Input.mouse_pos_x
        y = Input.mouse_pos_y 

        Window.draw(x, y, @image) 
        
        if Input.mouse_down?(M_LBUTTON) then   
            Window.draw_font(x, y, "left", Font.new(32))
        end
        if Input.mouse_down?(M_RBUTTON) then
            Window.draw_font(x, y, "right", Font.new(32))
        end
    end
end
