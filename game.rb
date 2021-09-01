INFO = {
  scene: :title,
  min: 0,
  sec: 0,
  }

class Game
  def initialize
    @exit_image = Image.load("images/exit_image.png")
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
    Window.draw_font(100, 300, "#{INFO[:min]}:#{INFO[:sec]}", @font)
  end

  def run
    Window.loop do
      case INFO[:scene]
      when :title
        Window.draw_font(100, 100, "title", @font)
         if Input.key_push?(K_SPACE)
           INFO[:scene] = :playing
         end
      when :playing
        Window.draw_font(100, 100, "playing", @font)
        @cursor.move
        if @timeFlag == 0
          @start = Time.now
          @timeFlag = 1
        end

        timer(@start)

        if INFO[:min] == 0 and INFO[:sec] == 0
          INFO[:scene] = :exit
        end
      when :exit
        Window.draw(0, 0, @exit_image)
        Window.draw_font(495, 395, "SCORE: 5000", @font)
        if Input.key_push?(K_SPACE)
          INFO[:scene] = :title
        elsif Input.key_push?(K_ESCAPE)
          exit
        end
      end
    end
  end
end