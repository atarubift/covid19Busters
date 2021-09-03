class MinusTarget < Target
  def initialize(x, y, dx, dy, score)
    super
    @sound = Sound.new("sounds/minusVanish.wav")
    self.image = Image.load("images/vaccine.png")
  end

  def hit
    super
    if Input.mouse_push?(M_LBUTTON)
      @sound.play
    end
  end
end

class CircleMinusTarget < CircleTarget
  def initialize(x, y, score)
    super
    self.image = Image.load("images/vaccine.png")
    @sound = Sound.new("sounds/minusVanish.wav")
  end

  def hit
    super
    if Input.mouse_push?(M_LBUTTON)
      @sound.play
    end
  end
end