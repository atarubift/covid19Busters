INFO = {
  scene: :title,
  min: 0,
  sec: 0,
  born: Time.now
  }

class Game
  def initialize
    $score = 0
    @exit_image = Image.load("images/exit_image.png")
    @title_image = Image.load("images/titlescreen.png")
    @playing_image = Image.load("images/hand_background.png")
    @font = Font.new(32)
    @timeFlag = 0
    @start = 0
    @cursor = Cursor.new
  end

  def timer(start)
    now = Time.now
    limit = 2 * 60
    diff = now - start
    countdown = (limit - diff).to_i
    INFO[:min] = countdown / 60
    INFO[:sec] = countdown % 60
    ten = INFO[:sec] / 10
    one = INFO[:sec] % 10
    Window.draw_font(10, 15, "#{INFO[:min]}:#{ten}#{one}", @font, color:[0,0,0])
  end

  def run
    Window.loop do
      case INFO[:scene]
      when :title
        Window.draw(0, 0, @title_image)
        Window.draw_font(290, 100, "Covid-19 Buster", @font)
        Window.draw_font(275, 215, "Press Space to Start", @font)
         if Input.key_push?(K_SPACE)
           INFO[:scene] = :playing
         end
      when :playing

        Window.draw(0, 0, @playing_image)
        if @timeFlag == 0
          @start = Time.now  
          @timeFlag = 1
        end
        
        Target.add(INFO[:min],INFO[:sec],"images/virus.png",10) if rand(40) == 0
        MinusTarget.add(INFO[:min],INFO[:sec],"images/vaccine.png",10) if rand(40) == 0

        if (Time.now - INFO[:born]) >= 2
          HighTarget.add(INFO[:min],INFO[:sec],"images/extra_point.png",15) 
          INFO[:born] = Time.now  
        end
    
        Target.collection.each do |target|
          target.update(INFO[:min],INFO[:sec])
          target.draw
          Sprite.check(@cursor,target)
        end
        
        @cursor.move
        timer(@start)
        if INFO[:min] == 0 and INFO[:sec] == 0
          INFO[:scene] = :exit
        end
        Window.draw_font(100, 15, "SCORE:#{$score}", @font,color:[0,0,0])
      when :exit
        Window.draw(0, 0, @exit_image)
        Window.draw_font(495, 395, "SCORE: 5000", @font)
        if Input.key_push?(K_SPACE)
          INFO[:scene] = :title
          initialize
        elsif Input.key_push?(K_ESCAPE)
          exit
        end
      end
    end
  end
end