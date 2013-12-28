module SVGen
  module Element
    class Circle < Base
      def initialize(attrs = {})
        super(attrs)
        @cx = attrs[:cx] || 0
        @cy = attrs[:cy] || 0
        @r = attrs[:r] || 10
        @fill = attrs[:fill] || "white"
      end

      def generate(svg)
        svg.circle(attributes)
      end
    end
  end
end
