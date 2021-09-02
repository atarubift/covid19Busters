class Target < Sprite
    @@collection = []

    def self.collection
        @@collection
    end


    def self.add(min,sec)
        #縦と横のレーンに的があるかチェック
        check_line_x = true
        check_line_y = true
        x = rand(7) * 100
        normal_score = 50
        high_score = 200
        minus_score = -50
        @@collection.each do |target|
          if target.x == x
            check_line_x = false
            break
          end
        end

        y = rand(5) * 100
        @@collection.each do |target|
          if target.y == y
            check_line_y = false
            break
          end
        end

        #時間よって出方を変える
        #乱数によって出る的を変える。ノーマル:マイナス:高得点=4:3:2
        #一分を切ったら円運動に変える
        per = rand(15)
        if min >= 1 && sec >= 30
            if check_line_x
                if per > 10
                    @@collection << NormalTarget.new(x, 600, 0, -10, normal_score)
                elsif per > 5
                    @@collection << MinusTarget.new(x, 0, 0, 10, minus_score)
                elsif per > 2
                    @@collection << DoubleTarget.new(x, 0, 0, 10, 0)
                else
                    @@collection << HighTarget.new(x, 0, 0, 15, high_score)
                end
            end
        elsif min >= 1  && sec >= 0
            if check_line_y
                if per > 10
                    @@collection << NormalTarget.new(800, y, -10, 0, normal_score)
                elsif per > 5
                    @@collection << MinusTarget.new(0, y, 10, 0, minus_score)
                elsif per > 2
                    @@collection << DoubleTarget.new(0, y, 10, 0, 0)
                else
                    @@collection << HighTarget.new(0, y, 15, 0, high_score)
                end
            end
        elsif min >= 0 && min < 1
            rand(2) == 0 ? x = 0 : x = 800
            if per > 10
                @@collection << CircleNormalTarget.new(x, 0, normal_score)
            elsif per > 5
                @@collection << CircleMinusTarget.new(x, 0, minus_score)
            elsif per > 2
                @@collection << CircleDoubleTarget.new(x, 0, 0)
            else
                @@collection << CircleHighTarget.new(x, 0, high_score)
            end
        end
    end

    #初期のx座標、y座標、移動する速さ
    def initialize(x, y, dx, dy, score)
        self.x = x
        self.y = y
        @score = score
        @font = Font.new(32)
        @time = 0
        @dx = dx
        @dy = dy
        @hitime = 0

        #的が止まる座標
        @stop_place_top = rand(500)
        @stop_place_bottom = @stop_place_top + 50
        @stop_place_left = rand(700)
        @stop_place_right = @stop_place_left + 50
    end

    def update(min ,sec)

        self.x += @dx if @stop_place_left > self.x || @stop_place_right < self.x
        self.y += @dy if @stop_place_top > self.y || @stop_place_bottom < self.y 
        self.draw

        #時間経過で消える
        @time += 1
        self.class.collection.delete(self) if @time > 200

        if self.vanished?
            if Time.now - @hitime < 0.5
              Window.draw_font(375, 10, "#{sprintf("%+d", @score)}", @font, color: C_BLACK)
            end
        end
    end

    def hit
        if Input.mouse_push?(M_LBUTTON)
            @hitime = Time.now
            self.vanish           
            $score += @score
            
        end
    end
end
