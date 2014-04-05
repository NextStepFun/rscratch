module RScratch 
  class Sprite
    def avanza n
      @x +=  Gosu::offset_x(@angle, n)
      @y +=  Gosu::offset_y(@angle, n)
    end

    def mostra
      @mostra = true
    end

    def nascondi
      @mostra = false
    end

    def ruota v
      @angle += v
    end

    def quando_premo(params = {}, &block)
      if params[:tasto] 
        $window.register_key params[:tasto] do
          instance_eval(&block)
        end
      end
    end
  end
end
