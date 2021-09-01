class HighTarget < Target

    def update(min,sec)
        @time += 1
        self.x += @dx if @stop_place_left > self.x || @stop_place_right < self.x
        self.y += @dy if @stop_place_top > self.y || @stop_place_bottom < self.y
        self.class.collection.delete(self) if @time > 50
    end

end