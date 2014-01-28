require "builder"

module SVGen
  class SVG
    include Nestable

    def initialize(attrs = {}, &block)
      @children = []
      @attrs = attrs
      block.call(self) if block_given?
    end

    def generate
      builder = Builder::XmlMarkup.new(indent: 2)
      builder.svg(@attrs.merge({ xmlns: "http://www.w3.org/2000/svg" })) do |svg|
        @children.each { |child| child.generate(svg) }
      end
    end
  end
end
