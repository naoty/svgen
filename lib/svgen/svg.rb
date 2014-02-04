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

    def method_missing(name, *args)
      case name.to_s
      when /^(.+)=$/
        super unless value = args.first
        @attrs.has_key?($1) ? @attrs[$1] = value : @attrs[$1.to_sym] = value
      else
        @attrs[name] || @attrs[name.to_sym]
      end
    end
  end
end
