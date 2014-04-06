require 'RMagick'
module RScratch
  def get_image(image_name, opts={})
    img = nil
    ['png','jpg','jpeg','svg'].each do |ext|
      full_name = RSCRATCH_BASEDIR + "/media/sprites/#{image_name}.#{ext}"
      if File.exists?(full_name)
        img = if ext=='svg'
          svg = Magick::Image.read(full_name) do
            self.background_color = "transparent"
          end.first
          svg.flop! if opts[:flip] == :horizontal
          svg.flip! if opts[:flip] == :vertical
          Gosu::Image.new($window, svg, false)
        else
          Gosu::Image.new($window, full_name, false)
        end
      end
    end
    throw "immagine #{image_name} non trovata!" unless img
    img
  end
end
