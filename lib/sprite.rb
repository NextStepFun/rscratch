module RScratch
  class Sprite 
    def initialize(image:'', x:0, y:0, angle: angle, &block)
      @image = Gosu::Image.new($window, "media/#{image}",  false)
      @x, @y = x, y 
      @angle = angle
      instance_eval(&block)
    end

    def draw
      @image.draw_rot(@x, @y, 1 , @angle)
    end
  end
end
