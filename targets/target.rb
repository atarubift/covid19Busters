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
        per = rand(10)
        if min >= 1 && sec >= 30
            if check_line_x
                if per > 5
                    @@collection << NormalTarget.new(x,600,0,-10,"images/virus.png")
                elsif per > 1
                    @@collection << MinusTarget.new(x,0,0,10,"images/vaccine.png")
                else
                    @@collection << HighTarget.new(x,0,0,15,"images/extra_point.png")
                end
            end
        elsif min >= 1  && sec >= 0
            if check_line_y
                if per > 5
                    @@collection << NormalTarget.new(800,y,-10,0,"images/virus.png")
                elsif per > 1
                    @@collection << MinusTarget.new(0,y,10,0,"images/vaccine.png")
                else
                    @@collection << HighTarget.new(0,y,15,0,"images/extra_point.png") 
                end
            end
        elsif min >= 0 && min < 1 && sec >= 30 && check_line_y
        elsif min >= 0 && min < 1  && sec >= 0 && check_line_y
        end
    end

    #初期のx座標、y座標、移動する速さ
    def initialize(x, y, dx, dy ,img)
        self.x = x
        self.y = y
        self.image = Image.load(img)
        @time = 0
        @dx = dx
        @dy = dy

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
    end

end
