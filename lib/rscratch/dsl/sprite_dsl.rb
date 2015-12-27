module RScratch 
  class Sprite 

    def move n
      @x +=  Gosu::offset_x(@angle, n)
      @y +=  Gosu::offset_y(@angle, n)
    end

    def show 
      @show = true
    end

    def hide
      @show = false
    end

    def change_x_of(x)
      @x += x
    end
    
    def change_y_of(y)
      @y += y
    end

    def go_where_x_is(x)
      @x = x
    end

    def go_where_y_is(y)
      @y = y
    end

    def go_to(x,y)
      @x, @y = x, y
    end

    def change_size_by(zoom)
      @zoom = zoom
    end

    def shrink(factor)
      @zoom /= factor
    end

    def grow(factor)
      @zoom *= factor
    end

    def look_left
      @show_left = true
    end

    def look_right
      @show_left = false
    end

    def make_sound(sound_name)
      #TODO
    end

    def rotate angle
      @angle += angle
    end

    def key_pressed(params = {}, &block)
      if params[:key] 
        $window.register_key params[:key] do
          instance_eval(&block)
        end
      end
    end
  end
end
