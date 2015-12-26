module RScratch
  LANG = :en

  class DSL
    def klass
      self.class
    end

    def method_missing m, **args, &block
      if klass.tr?(m)
        send(klass.tr(m),**klass.tr_args(m,args),&block)
      else 
        super(m,args,block)
      end
    end

    def respond_to?(m)
      klass.tr?(m) || super(m)
    end

    class << self
      def translate lang, translation
        translations[lang] = translation
      end

      def tr?(m)
        !!tr(m)
      end

      def tr(m)
        return m if LANG == :en
        translation_for(m)[:name]
      end

      def tr_args(m,args)
        return args if LANG == :en
        args.reduce({}){|h,arr| h[tr_arg(m,arr[0])]=arr[1];h }
      end

      def tr_arg(m,arg)
        raise "Argument #{arg} translation to #{LANG} missing" unless translation_for(m)[:args][arg]
        translation_for(m)[:args][arg]
      end

      def translation_for(m)
        raise "Language missing" unless @translations.include?(LANG) 
        raise "Method #{m} translation to #{LANG} missing" unless @translations[LANG].include?(m)
        @translations[LANG][m]
      end

      def translations
        @translations ||= {}
      end
    end
  end

end
