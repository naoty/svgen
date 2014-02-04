module SVGen
  module Nestable
    def rect(attrs = {})
      @children << Element::Rect.new(attrs)
    end

    def circle(attrs = {})
      @children << Element::Circle.new(attrs)
    end

    def text(text, attrs = {})
      @children << Element::Text.new(text, attrs)
    end

    def line(attrs = {})
      @children << Element::Line.new(attrs)
    end

    def path(attrs = {})
      @children << Element::Path.new(attrs)
    end

    def group(attrs = {}, &block)
      @children << Element::Group.new(attrs, &block)
    end
    alias :g :group
  end
end
