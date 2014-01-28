module SVGen
  module Element
    class Text
      def initialize(text, attrs = {})
        @text = text
        @attrs = attrs
      end

      def generate(svg)
        svg.text(@text, @attrs)
      end
    end
  end
end
