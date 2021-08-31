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
        if min >= 1 && sec >= 30 && check_line_x
            @@collection << self.new(x,600,0,-10)
        elsif min >= 1  && sec >= 0 && check_line_x
            @@collection << self.new(x,0,0,10)
        elsif min >= 0 && min < 1 && sec >= 30 && check_line_y
            @@collection << self.new(800,y,-10,0)
        elsif min >= 0 && min < 1  && sec >= 0 && check_line_y
            @@collection << self.new(0,y,10,0)
        end
    end

    #初期のx座標、y座標、移動する速さ
    def initialize(x, y, dx,dy)
        self.x = x
        self.y = y
        self.image = Image.load("images/virus.png")
        @time = 0
        @dx = dx
        @dy = dy

        #的が止まる座標
        @stop_place_top = rand(500)
        @stop_place_bottom = @stop_place_top + 10
        @stop_place_left = rand(700)
        @stop_place_right = @stop_place_left + 10
    end

    def update(min ,sec)

        self.x += @dx if @stop_place_left > self.x || @stop_place_right < self.x
        self.y += @dy if @stop_place_top > self.y || @stop_place_bottom < self.y 
        
        #時間経過で消える
        @time += 1
        self.class.collection.delete(self) if @time > 200
    end

end