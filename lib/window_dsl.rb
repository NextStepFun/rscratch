module RScratch
  def finestra(x: 640, y: 480, titolo:'')
    $window = GameWindow.new(x,y,titolo)
    yield if block_given?
    $window.show
  end

  def aggiungi_sprite(immagine: '', x:0, y:0,direzione: 90,  &block)
    $window.sprites << Sprite.new(image:immagine, x:x, y:y, angle: direzione, &block)
  end
end
