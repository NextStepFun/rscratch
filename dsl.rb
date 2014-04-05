require 'gosu'

module Finestra
  def gosu_key(str)
    case str
    when :su then Gosu::KbUp
    when :giu then Gosu::KbDown
    when :destra then Gosu::KbRight
    when :sinistra then Gosu::KbLeft
    else
      eval("Gosu::Kb#{str.upcase}")
    end
  end

  class GameWindow < Gosu::Window
    def initialize(x,y,caption)
      super x,y,false
      self.caption = caption
      @sprites ||= []
      @registered_keys ||= {}
    end

    def sprites
      @sprites
    end

    def draw
      @sprites.map(&:draw)
    end

    def register_key key, &block
      @registered_keys[key] = block
    end

    def update
      @registered_keys.each do |key,block| 
        block.call if button_down? gosu_key(key)
      end
    end
  end

  def finestra(x: 640, y: 480, titolo:'')
    $window = GameWindow.new(x,y,titolo)
    yield if block_given?
    $window.show
  end

  def aggiungi_sprite(immagine: '', x:0, y:0,direzione: 90,  &block)
    $window.sprites << Sprite.new(image:immagine, x:x, y:y, angle: direzione, &block)
  end

  class Sprite 
    def initialize(image:'', x:0, y:0, angle: angle, &block)
      @image = Gosu::Image.new($window, "media/#{image}",  false)
      @x, @y = x, y 
      @angle = angle
      instance_eval(&block)
    end

    def avanza n
      @x +=  Gosu::offset_x(@angle, n)
      @y +=  Gosu::offset_y(@angle, n)
    end

    def ruota v
      @angle += v
    end

    def draw
      @image.draw_rot(@x, @y, 1 , @angle)
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

