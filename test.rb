require_relative 'dsl.rb'
include RScratch

finestra titolo: "titolo!" do

  aggiungi_sprite immagine: 'freccia_verde.png',
          posizione: :centro, direzione: 90 do

    quando_premo tasto: :su do
      avanza 10
    end

    quando_premo tasto: :destra do
      ruota 5
    end

    quando_premo tasto: :sinistra do
      ruota(-5)
    end

    quando_premo tasto: :giu do
      avanza(-10)
    end

  end

end