class HighTarget < Target

    def self.add(min,sec,img)
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
            @@collection << self.new(x,600,0,-15,img)
        elsif min >= 1  && sec >= 0 && check_line_x
            @@collection << self.new(x,0,0,15,img)
        elsif min >= 0 && min < 1 && sec >= 30 && check_line_y
            @@collection << self.new(800,y,-15,0,img)
        elsif min >= 0 && min < 1  && sec >= 0 && check_line_y
            @@collection << self.new(0,y,15,0,img)
        end
    end

    def update(min,sec)
        @time += 1
        self.x += @dx if @stop_place_left > self.x || @stop_place_right < self.x
        self.y += @dy if @stop_place_top > self.y || @stop_place_bottom < self.y
        self.class.collection.delete(self) if @time > 50
    end

    def hit
      if Input.mouse_push?(M_LBUTTON)
          self.vanish
          $score += 100
      end
  end

end