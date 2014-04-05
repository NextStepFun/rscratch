module RScratch
  class Drawable
    def initialize(&block)
      @block = block
    end

    def draw
      @block.call
    end
  end
end
