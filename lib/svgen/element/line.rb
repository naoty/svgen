module SVGen
  module Element
    class Line
      def initialize(attrs = {})
        @attrs = attrs
      end

      def generate(svg)
        svg.line(@attrs)
      end
    end
  end
end
