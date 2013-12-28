require "builder"

module SVGen
  class SVG
    def initialize(attrs = {})
      @children = []
      @width = attrs[:width] || 400
      @height = attrs[:height] || 300
      yield(self) if block_given?
    end

    def rect(attrs = {})
      @children << Element::Rect.new(attrs)
    end

    def circle(attrs = {})
      @children << Element::Circle.new(attrs)
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
