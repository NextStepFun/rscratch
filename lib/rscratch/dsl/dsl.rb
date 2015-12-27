module RScratch
  class DSL
    #TODO: This should be moved to a separate GEM
    include RScratch::I18n::Translable
    extend RScratch::I18n::TranslableClass
  end
end
