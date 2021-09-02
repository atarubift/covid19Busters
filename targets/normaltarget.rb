class NormalTarget < Target
    def initialize(x, y, dx, dy, score)
        super
        self.image = Image.load("images/virus.png")
    end

    def hit
        if Input.mouse_push?(M_LBUTTON)
            @hitime = Time.now
            self.vanish
            $score += @score
        end
    end
end

class CircleNormalTarget < CircleTarget
    def initialize(x, y, score)
        super
        self.image = Image.load("images/virus.png")
    end

    def hit
        if Input.mouse_push?(M_LBUTTON)
            @hitime = Time.now
            self.vanish
            $score += @score
        end
    end
end

