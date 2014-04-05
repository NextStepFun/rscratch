module RScratch
  def finestra(altezza: 640, larghezza: 480, titolo:'')
    $window = GameWindow.new(altezza,larghezza,titolo)
    yield if block_given?
    $window.show
  end

  def aggiungi_sprite(immagine: '', y:0, x:0, posizione: nil, direzione: 90,  &block)
    if posizione == :centro
      x = $window.height/2
      y = $window.width/2
    end
    $window.sprites << Sprite.new(image:immagine, x:x, y:y, angle: direzione, &block)
  end
end
