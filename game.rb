INFO = {
  scene: :title,
  min: 0,
  sec: 0,
  }

class Game
  def initialize
    reset
  end

  def reset
    @title_image = Image.load("images/titlescreen.png")
    @playing_image = Image.load("images/hand_background.png")
    @font = Font.new(32)
    @timeFlag = 0
    @start = 0
    @cursor = Cursor.new
  end

  def timer(start)
    now = Time.now
    limit = 5
    diff = now - start
    countdown = (limit - diff).to_i
    INFO[:min] = countdown / 60
    INFO[:sec] = countdown % 60
    ten = INFO[:sec] / 10
    one = INFO[:sec] % 10
    Window.draw_font(100, 300, "#{INFO[:min]}:#{ten}#{one}", @font)
  end

  def run
    Window.loop do
      case INFO[:scene]
      when :title
        Window.draw(0, 0, @title_image)
        Window.draw_font(290, 100, "Covid-19 Buster", @font)
        Window.draw_font(270, 215, "Press Space to Start", @font)
         if Input.key_push?(K_SPACE)
           INFO[:scene] = :playing
         end
      when :playing
        Window.draw(0, 0, @playing_image)
        Window.draw_font(100, 100, "playing", @font)
        @cursor.move
        if @timeFlag == 0
          @start = Time.now
          @timeFlag = 1
        end

        timer(@start)

        if Input.key_push?(K_SPACE)
          INFO[:scene] = :exit
        end
      when :exit
        Window.draw_font(100, 100, "exit", @font)
        if Input.key_push?(K_SPACE)
          INFO[:scene] = :title
          reset
        end
      end
    end
  end
end