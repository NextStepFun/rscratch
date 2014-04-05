module RScratch
  def finestra(altezza: 640, larghezza: 480, titolo:'')
    $window = GameWindow.new(altezza,larghezza,titolo)
    yield if block_given?
    $window.show
  end

  def sfondo_sfumato(da:0xFF1EB1FA, a:0xFF1D4DB5)
    col1 = Gosu::Color.new(da)
    col2 = Gosu::Color.new(a)
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

  def aggiungi_sprite(immagine: '', y:0, x:0, posizione: nil, direzione: 90,  &block)
    sprite = Sprite.new(image:immagine, x:x, y:y, angle: direzione, &block)
    if posizione == :centro
      x = ($window.height/2) - (sprite.height/2)
      y = ($window.width/2) - (sprite.width/2)
    end
    sprite.vai_a(x,y)
    $window.sprites << sprite
    sprite
  end
end
