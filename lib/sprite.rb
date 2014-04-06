module RScratch
  class Sprite 

    def initialize(image:'', x:0, y:0, angle: angle, &block)
      @image = get_image(image) 
      @x, @y = x, y 
      @angle = angle
      @show = true
      instance_eval(&block)
    end

    def width
      @image.width
    end

    def height
      @image.height
    end

    def draw
      @image.draw_rot(@x, @y, 1 , @angle) if @show
    end
  end
end
