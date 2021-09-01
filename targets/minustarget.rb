class MinusTarget < Target
  def hit
    if Input.mouse_push?(M_LBUTTON)
        self.vanish
        $score += -50
    end
  end
end