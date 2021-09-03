class MinusTarget < Target
  def initialize(x, y, dx, dy, score)
    super
    self.image = Image.load("images/vaccine.png")
  end

  def hit
    super
    if Input.mouse_push?(M_LBUTTON)
      @minsound.play
    end
  end
end

class CircleMinusTarget < CircleTarget
  def initialize(x, y, score)
    super
    self.image = Image.load("images/vaccine.png")
  end

  def hit
    super
    if Input.mouse_push?(M_LBUTTON)
      @minsound.play
    end
  end
end