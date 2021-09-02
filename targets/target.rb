class Target < Sprite
    @@collection = []

    def self.collection
        @@collection
    end

    def self.add(min,sec,img,speed, score)
        #縦と横のレーンに的があるかチェック
        check_line_x = true
        check_line_y = true
        x = rand(7) * 100
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

        #30秒毎に出てくる方向を変える
        if min >= 1 && sec >= 30 && check_line_x
            @@collection << self.new(x,600,0,-speed,img, score)
        elsif min >= 1  && sec >= 0 && check_line_x
            @@collection << self.new(x,0,0,speed,img, score)
        elsif min >= 0 && min < 1 && sec >= 30 && check_line_y
            @@collection << self.new(800,y,-speed,0,img, score)
        elsif min >= 0 && min < 1  && sec >= 0 && check_line_y
            @@collection << self.new(0,y,speed,0,img, score)
        end
    end

    #初期のx座標、y座標、移動する速さ
    def initialize(x, y, dx, dy ,img, score)
        self.x = x
        self.y = y
        self.image = Image.load(img)
        @score = score
        @font = Font.new(32)
        @time = 0
        @dx = dx
        @dy = dy

        #的が止まる座標
        @stop_place_top = rand(500)
        @stop_place_bottom = @stop_place_top + 30
        @stop_place_left = rand(700)
        @stop_place_right = @stop_place_left + 30
    end

    def update(min ,sec)

        self.x += @dx if @stop_place_left > self.x || @stop_place_right < self.x
        self.y += @dy if @stop_place_top > self.y || @stop_place_bottom < self.y 
        
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
