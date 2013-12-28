module SVGen
  module Element
    class Base
      def initialize(attrs = {})
        @x = attrs[:x] || 0
        @y = attrs[:y] || 0
        @stroke = attrs[:stroke]
        @stroke_width = attrs[:"stroke-width"] || attrs["stroke-width"]
      end

      def generate(svg)
        raise NotImplementedError.new("Subclass must override SVGen::Element::Base#generate")
      end

      protected

      def attributes
        attrs = {}
        instance_variables.each do |instance_variable|
          value = instance_variable_get(instance_variable)
          next if value.nil?
          key = instance_variable.to_s.gsub(/@/) { "" }
          key = key.gsub(/_/) { "-" }
          attrs[key.to_sym] = value
        end
        attrs
      end
    end
  end
end
