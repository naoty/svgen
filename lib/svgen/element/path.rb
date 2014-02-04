module SVGen
  module Element
    class Path
      def initialize(attrs = {})
        @attrs = attrs
      end

      def generate(svg)
        svg.path(@attrs)
      end
    end
  end
end
