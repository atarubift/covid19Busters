INFO = {
  scene: :title,
  min: 0,
  sec: 0,
  born: Time.now
  }

class Game
  def initialize
    @three = Image.load("images/3.png")
    @two = Image.load("images/2.png")
    @one = Image.load("images/1.png")
    @go = Image.load("images/START.png")
    @transition_time = 0
    @middle_image = Image.load("images/middle_image.png")
    $score = 0
    @exit_image = Image.load("images/exit_image.png")
    @title_image = Image.load("images/titlescreen.png")
    @playing_image = Image.load("images/hand_background.png")
    @font = Font.new(32)
    @timeFlag = 0
    @start = 0
    @cursor = Cursor.new
    $double_flag = 0
    $double_time = 0
  end

  def timer(start)
    now = Time.now
    limit =  2 * 60
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
          @transition_time = Time.now
           INFO[:scene] = :dirty_hand
         end

        when :dirty_hand
          timing = (Time.now-@transition_time).to_i
          Window.draw(0, 0, @middle_image)
          if   timing ==2
            Window.draw(0, 0, @three)
          elsif timing ==3
            Window.draw(0, 0, @two)
          elsif timing ==4
            Window.draw(0, 0, @one)
          elsif timing ==5
            Window.draw(0, 0, @go)
          elsif timing ==6
          INFO[:scene] = :playing
          end

        when :playing
        Window.draw(0, 0, @playing_image)
        if @timeFlag == 0
          @start = Time.now  
          @timeFlag = 1
        end
        
        Target.add(INFO[:min],INFO[:sec]) if rand(50) == 0   
        Target.collection.each do |target|
          target.update(INFO[:min],INFO[:sec])
          Sprite.check(@cursor,target)
        end

        if $double_flag == 1
          remaining_time = 5.0 - (Time.now - $double_time)
          Window.draw_font(630, 10, "×2", @font, color: C_RED)
          Window.draw_font(690, 10, "#{remaining_time.round(1)}", @font, color: C_RED)
        end

        if $double_flag == 1
          if Time.now - $double_time > 5
            $double_flag = 0
          end
        end
        
        @cursor.move
        timer(@start)
        if INFO[:min] == 0 and INFO[:sec] == 0
          INFO[:scene] = :exit
        end
        Window.draw_font(100, 15, "SCORE:#{$score}", @font,color:[0,0,0])
      when :exit
        Window.draw(0, 0, @exit_image)
        Window.draw_font(495, 395, "SCORE: #{$score}", @font)
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