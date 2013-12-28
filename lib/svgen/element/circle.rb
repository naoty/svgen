module SVGen
  module Element
    class Circle < Base
      def initialize(attrs = {})
        super(attrs)
        @cx = attrs[:cx] || 0
        @cy = attrs[:cy] || 0
        @r = attrs[:r] || 10
        @fill = attrs[:fill] || "rgba(0, 0, 0, 0)"
      end

      def generate(svg)
        svg.circle(attributes)
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
