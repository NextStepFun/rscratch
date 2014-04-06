require 'RMagick'
module RScratch
  def get_image(image_name, opts={})
    image = nil
    ['png','jpg','jpeg','svg'].each do |ext|
      full_name = RSCRATCH_BASEDIR + "/media/sprites/#{image_name}.#{ext}"
      if File.exists?(full_name)
        img = Magick::Image.read(full_name) do
          self.background_color = "transparent"
        end.first
        img.flop! if opts[:flip] == :horizontal
        img.flip! if opts[:flip] == :vertical
        image = Gosu::Image.new($window, img, false)
      end
    end
    throw "immagine #{image_name} non trovata!" unless image
    image
  end
end
