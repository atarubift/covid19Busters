class NormalTarget < Target
    def initialize(x, y, dx, dy)
        super
        self.image = Image.load("images/virus.png")
    end

    def hit
        if Input.mouse_push?(M_LBUTTON)
            self.vanish
            $score += 50
        end
    end
end

class CircleNormalTarget < CircleTarget
    def initialize(x, y)
        super
        self.image = Image.load("images/virus.png")
    end

    def hit
        if Input.mouse_push?(M_LBUTTON)
            self.vanish
            $score += 50
        end
    end
end

