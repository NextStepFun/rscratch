module Finestra
  def gosu_key(str)
    case str
    when :su then Gosu::KbUp
    when :giu then Gosu::KbDown
    when :destra then Gosu::KbRight
    when :sinistra then Gosu::KbLeft
    else
      eval("Gosu::Kb#{str.upcase}")
    end
  end
end

