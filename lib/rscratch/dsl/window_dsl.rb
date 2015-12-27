module RScratch

  def window(height: 640, width: 480, title:'')
    $window = GameWindow.new(height,width,title)
    yield if block_given?
    $window.show
  end

  def shaded_background(from: 0xFF1EB1FA, to: 0xFF1D4DB5)
    col1 = Gosu::Color.new(from)
    col2 = Gosu::Color.new(to)
    width = $window.width
    height = $window.height
    $window.on_draw do
      $window.draw_quad(
        0,     0,      col1,
        width, 0,      col1,
        0,     height, col2,
        width, height, col2,
        0)
    end
  end

  def add_sprite(image: '', y:0, x:0, position: nil, direction: 90, dimension: 1, rotation: :rotate, &block)
    sprite = Sprite.new(image:image, x:x, y:y, angle: direction, zoom: dimension, rotation: rotation, &block)
    if position == :center
      x = $window.height/2
      y = $window.width/2
    end
    sprite.go_to(x,y)
    $window.sprites << sprite
    sprite
  end
end
