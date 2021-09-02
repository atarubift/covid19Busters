class DoubleTarget < HighTarget
    def hit
        if Input.mouse_push?(M_LBUTTON)
            self.vanish
            $score *= 2
        end
    end
end