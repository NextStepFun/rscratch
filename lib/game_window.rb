module RScratch 
  class GameWindow < Gosu::Window
    def initialize(width,height,caption)
      super width,height,false
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
end
