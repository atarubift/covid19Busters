class MinusTarget < Target
  def hit
    if Input.mouse_push?(M_LBUTTON)
        @hitime = Time.now
        self.vanish
        $score += @score
    end
  end
end