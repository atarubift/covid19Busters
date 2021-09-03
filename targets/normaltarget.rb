class NormalTarget < Target
    def initialize(x, y, dx, dy, score)
        super
        self.image = Image.load("images/virus.png")
    end

    def hit
        if Input.mouse_push?(M_LBUTTON)
            @sound.play
            @hitime = Time.now
            if $double_flag == 1
                if Time.now - $double_time <= 5
                    $score += @score*2
                else
                    $double_flag = 0
                    $score += @score
                end
            else
                $score += @score
            end
            self.vanish
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
            @sound.play
            @hitime = Time.now
            if $double_flag == 1
                if Time.now - $double_time <= 5
                    $score += @score*2
                else
                    $double_flag = 0
                    $score += @score
                end
            else
                $score += @score
            end
            self.vanish

        end
    end
end

