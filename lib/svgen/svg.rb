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
      builder.instruct! :xml, version: "1.0", encoding: "UTF-8", standalone: "no"
      builder.declare! :DOCTYPE, :svg, :PUBLIC, "-//W3C//DTD SVG 1.1//EN", "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"
      builder.svg(width: @width, height: @height, xmlns: "http://www.w3.org/2000/svg") do |svg|
        @children.each { |child| child.generate(svg) }
      end
    end
  end
end
