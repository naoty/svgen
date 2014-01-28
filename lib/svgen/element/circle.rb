module SVGen
  module Element
    class Circle
      def initialize(attrs = {})
        @attrs = attrs
      end

      def generate(svg)
        svg.circle(@attrs)
      end
    end
  end
end
