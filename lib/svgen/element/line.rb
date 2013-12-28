module SVGen
  module Element
    class Line < Base
      def initialize(attrs = {})
        super(attrs)
        @x1 = attrs[:x1] || @x
        @y1 = attrs[:y1] || @y
        @x2 = attrs[:x2] || @x
        @y2 = attrs[:y2] || @y
      end

      def generate(svg)
        svg.line(attributes)
      end

      protected

      def attributes
        attrs = super
        attrs.delete(:x)
        attrs.delete(:y)
        attrs
      end
    end
  end
end
