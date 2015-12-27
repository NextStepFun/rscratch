module RScratch
  LANG = :en

  class DSL
    def klass
      self.class
    end

    def method_missing m, **args, &block
      if klass.translated?(m)
        send(klass.translation(m),**klass.translate_args(m,args),&block)
      else 
        super(m,args,block)
      end
    end

    def respond_to?(m)
      klass.translated?(m) || super(m)
    end

    class << self
      def translate lang, translation
        translations[lang] = translation
      end

      def translated?(m)
        !!translation(m)
      end

      def translation(m)
        return m if LANG == :en
        translation_for(m)[:name]
      end

      def translate_args(m,args)
        return args if LANG == :en
        args.reduce({}){|h,arr| h[translate_arg(m,arr[0])]=arr[1];h }
      end

      def translate_arg(m,arg)
        raise TranslationMissingError, "Argument #{arg} translation to #{LANG} missing" unless translation_for(m)[:args][arg]
        translation_for(m)[:args][arg]
      end

      def translation_for(m)
        raise TranslationMissingError, "Language missing" unless @translations.include?(LANG) 
        raise TranslationMissingError, "Method #{m} translation to #{LANG} missing" unless @translations[LANG].include?(m)
        @translations[LANG][m]
      end

      def translations
        @translations ||= {}
      end
    end
  end

  class TranslationMissingError < Error
  end
end
