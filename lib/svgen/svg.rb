require "builder"

module SVGen
  class SVG
    include Nestable

    def initialize(attrs = {}, &block)
      @children = []
      @width = attrs[:width] || 400
      @height = attrs[:height] || 300
      block.call(self) if block_given?
    end

    def generate
      builder = Builder::XmlMarkup.new(indent: 2)
      builder.svg(width: @width, height: @height, xmlns: "http://www.w3.org/2000/svg") do |svg|
        @children.each { |child| child.generate(svg) }
      end
    end
  end
end
