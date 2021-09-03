class NormalTarget < Target
    def initialize(x, y, dx, dy, score)
        super
        @sound = Sound.new("sounds/vanishTarget.wav")
        self.image = Image.load("images/virus.png")
    end
end

class CircleNormalTarget < CircleTarget
    def initialize(x, y, score)
        super
        @sound = Sound.new("sounds/vanishTarget.wav")
        self.image = Image.load("images/virus.png")
    end
end

