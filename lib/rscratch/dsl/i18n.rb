module RScratch 
  module I18n

    def self.locale 
      @locale || :en
    end

    def self.locale=(locale)
      @locale = locale
    end

    module Translable
      def method_missing m, **args, &block
        if self.class.translated?(m)
          send(self.class.translation(m),**self.class.translate_args(m,args),&block)
        else 
          super(m,args,block)
        end
      end

      def respond_to?(m)
        self.class.translated?(m) || super(m)
      end
    end

    module TranslableClass
      def translate lang, translation
        translations[lang] = translation
      end

      def translated?(m)
        !!translation(m)
      end

      def translation(m)
        return m if RScratch::I18n.locale == :en
        translation_for(m)[:name]
      end

      def translate_args(m,args)
        return args if RScratch::I18n.locale == :en
        args.reduce({}){|h,arr| h[translate_arg(m,arr[0])]=arr[1];h }
      end

      def translate_arg(m,arg)
        raise TranslationMissingError, "Argument #{arg} translation to #{RScratch::I18n.locale} missing" unless translation_for(m)[:args][arg]
        translation_for(m)[:args][arg]
      end

      def translation_for(m)
        raise TranslationMissingError, "Language missing" unless @translations.include?(RScratch::I18n.locale) 
        raise TranslationMissingError, "Method #{m} translation to #{RScratch::I18n.locale} missing" unless @translations[RScratch::I18n.locale].include?(m)
        @translations[RScratch::I18n.locale][m]
      end

      def translations
        @translations ||= {}
      end
    end

    class TranslationMissingError < Exception
    end

  end
end
