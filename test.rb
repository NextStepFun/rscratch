require_relative 'dsl.rb'
include RScratch

finestra titolo: "Ruby Scratch!" do

  sfondo_sfumato

  aggiungi_sprite immagine: 'cat1-a',
          posizione: :centro, direzione: 0 do

    quando_premo tasto: :su do
      cambia_y_di(-5) 
    end

    quando_premo tasto: :destra do
      cambia_x_di(5) 
    end

    quando_premo tasto: :sinistra do
      cambia_x_di(-5) 
    end

    quando_premo tasto: :giu do
      cambia_y_di(5) 
    end

  end

end
