class MinusTarget < Target
  def initialize(x, y, dx, dy)
    super
    self.image = Image.load("images/vaccine.png")
  end

  def hit
    if Input.mouse_push?(M_LBUTTON)
        self.vanish
        $score += -50
    end
  end
end

class CircleMinusTarget < CircleTarget
  def initialize(x, y)
    super
    self.image = Image.load("images/vaccine.png")
  end

  def hit
    if Input.mouse_push?(M_LBUTTON)
        @hitime = Time.now
        self.vanish
        $score += @score
    end
  end
end