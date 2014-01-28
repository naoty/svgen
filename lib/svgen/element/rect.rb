module SVGen
  module Element
    class Rect
      def initialize(attrs = {})
        @attrs = attrs
      end

      def generate(svg)
        svg.rect(@attrs)
      end
    end
  end
end
