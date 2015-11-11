require_relative 'dsl.rb'
include RScratch

finestra titolo: "Ruby Scratch!" do

  sfondo_sfumato

  aggiungi_sprite immagine: 'cat1-a',
          posizione: :centro, direzione: 0,
          rotazione: :sinistra_destra do

    quando_premo tasto: :su do
      cambia_y_di(-5) 
      rimpicciolisci(1.01)
    end

    quando_premo tasto: :destra do
      guarda_a_destra
      cambia_x_di(5) 
    end

    quando_premo tasto: :sinistra do
      guarda_a_sinistra
      cambia_x_di(-5) 
    end

    quando_premo tasto: :giu do
      cambia_y_di(5) 
      ingrandisci(1.01)
    end

  end

end
