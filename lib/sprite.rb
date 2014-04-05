module RScratch
  class Sprite 

    def initialize(image:'', x:0, y:0, angle: angle, &block)
      @image = Gosu::Image.new($window, "media/#{image}",  false)
      @x, @y = x, y 
      @angle = angle
      @mostra = true
      instance_eval(&block)
    end

    def draw
      @image.draw_rot(@x, @y, 1 , @angle) if @mostra
    end
  end
end
