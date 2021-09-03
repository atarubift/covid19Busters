class MinusTarget < Target
  def initialize(x, y, dx, dy, score)
    super
      @minuSound = Sound.new("sounds/minusVanish.wav")
      self.image = Image.load("images/vaccine.png")
  end

  def hit
    if Input.mouse_push?(M_LBUTTON)
        @minuSound.play
        @hitime = Time.now
          self.vanish
        $score += @score
    end
  end
end

class CircleMinusTarget < CircleTarget
  def initialize(x, y, score)
    super
    self.image = Image.load("images/vaccine.png")
    @minuSound = Sound.new("sounds/minusVanish.wav")
  end

  def hit
    if Input.mouse_push?(M_LBUTTON)
        @minuSound.play
        @hitime = Time.now
        self.vanish
        $score += @score
    end
  end
end