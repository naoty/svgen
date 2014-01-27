module SVGen
  module Element
    class Rect < Base
      def initialize(attrs = {})
        super(attrs)
        @width = attrs[:width] || 100
        @height = attrs[:height] || 100
        @fill = attrs[:fill] || "none"
      end

      def generate(svg)
        svg.rect(attributes)
      end
    end
  end
end
