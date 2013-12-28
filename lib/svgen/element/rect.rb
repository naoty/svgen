module SVGen
  module Element
    class Rect < Base
      def initialize(attrs = {})
        @width = attrs[:width] || 100
        @height = attrs[:height] || 100
        @fill = attrs[:fill] || "white"
      end

      def generate(svg)
        svg.rect(width: @width, height: @height, fill: @fill)
      end
    end
  end
end
