module RScratch 
  class GameWindow < Gosu::Window

    def initialize(width,height,caption)
      super width,height,false
      self.caption = caption
      @sprites ||= []
      @registered_keys ||= {}
      @to_draw = []
    end

    def sprites
      @sprites
    end

    def draw
      @sprites.map(&:draw)
      @to_draw.map(&:draw)
    end

    def register_key key, &block
      @registered_keys[key] ||= []
      @registered_keys[key].push block
    end

    def on_draw(&block)
      @to_draw.push Drawable.new(&block)
    end

    def update
      @registered_keys.each do |key,blocks|
        blocks.map(&:call) if button_down? gosu_key(key)
      end
    end
  end
end
