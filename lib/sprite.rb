module RScratch
  class Sprite 

    def initialize(image:'', x:0, y:0, angle: angle, zoom: 1, rotate: :ruota, &block)
      @image = get_image(image) 
      @image_left = get_image(image, flip: :horizontal)
      @zoom = zoom

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
      if @show
        if @show_left 
          @image_left
        else
          @image
        end.draw_rot(@x, @y, 1, @angle, 0.5, 0.5, @zoom, @zoom) 
      end
    end
  end
end
