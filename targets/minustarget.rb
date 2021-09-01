class MinusTarget < Target
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
            @@collection << self.new(x,600,0,-10,img)
        elsif min >= 1  && sec >= 0 && check_line_x
            @@collection << self.new(x,0,0,10,img)
        elsif min >= 0 && min < 1 && sec >= 30 && check_line_y
            @@collection << self.new(800,y,-10,0,img)
        elsif min >= 0 && min < 1  && sec >= 0 && check_line_y
            @@collection << self.new(0,y,10,0,img)
        end
    end
end