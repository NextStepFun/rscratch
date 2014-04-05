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

    def cambia_x_di(x)
      @x += x
    end
    
    def cambia_y_di(y)
      @y += y
    end

    def vai_dove_x_vale(x)
      @x = x
    end

    def vai_dove_y_vale(y)
      @y = y
    end

    def produci_suono(nome)

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
