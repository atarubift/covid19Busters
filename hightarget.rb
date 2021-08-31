class HighTarget < Sprite
    @@collection = []

    def self.collection
        @@collection
    end

    def self.add(x,y)
        @@collection << self.new(x,y)
    end

    def initialize(x, y)
        self.x = x
        self.y = y
        self.image = Image.load("images/extra_point-modified_1.png")
        @stop_place = 0
        @time = 0
    end

    def update
        @time += 1 if @stop_place >= self.y
        self.y -=15 if @stop_place < self.y
        self.class.collection.delete(self) if @time > 2
    end

end