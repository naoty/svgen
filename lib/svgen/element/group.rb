module SVGen
  module Element
    class Group < Base
      include Nestable

      def initialize(attrs = {}, &block)
        @children = []
        @stroke = attrs[:stroke]
        @stroke_width = attrs[:"stroke-width"] || attrs["stroke-width"]
        block.call(self) if block_given?
      end

      def generate(svg)
        svg.g(attributes) do |g|
          @children.each { |child| child.generate(g) }
        end
      end

      protected

      def attributes
        attrs = super
        attrs.delete(:children)
        attrs
      end
    end
  end
end
