rscratch
========

Implementazione in ruby in lingua italiana dei comandi Scratch.

questo codice dovrebbe funzionare:

```ruby

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
```

questo dovrebbe essere il risultato:
![screenshot](https://github.com/RavennaLUG/rscratch/raw/master/media/screenshot.png)


### Installazione
se avete ruby (>=2.0) installato:

$ bundle install

### Eseguire l'esempio
$ ruby test.rb
