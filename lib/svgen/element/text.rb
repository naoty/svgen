module SVGen
  module Element
    class Text < Base
      def initialize(text, attrs = {})
        super(attrs)
        @text = text
      end

      def generate(svg)
        svg.text(@text, attributes)
      end

      protected

      def attributes
        attrs = super
        attrs.delete(:text)
        attrs
      end
    end
  end
end
