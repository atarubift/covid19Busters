class DoubleTarget < Target
    def initialize(x, y, dx, dy, score)
      super
      self.image = Image.load("images/2x_new-modified.png")
    end
  
    def hit
      if Input.mouse_push?(M_LBUTTON)
            @hitime = Time.now
            $double_flag = 1
            $double_time = Time.now
            puts($double_flag, $double_time)           
            self.vanish
      end
    end
  end

