module SVGen
  module Element
    class Group
      include Nestable

      def initialize(attrs = {}, &block)
        @children = []
        @attrs = attrs
        block.call(self) if block_given?
      end

      def generate(svg)
        svg.g(@attrs) do |g|
          @children.each { |child| child.generate(g) }
        end
      end
    end
  end
end
