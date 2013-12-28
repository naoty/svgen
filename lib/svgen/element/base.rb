module SVGen
  module Element
    class Base
      def initialize(attrs = {})
        @x = attrs[:x] || 0
        @y = attrs[:y] || 0
      end

      def generate(svg)
        raise NotImplementedError.new("Subclass must override SVGen::Element::Base#generate")
      end

      protected

      def attributes
        attrs = {}
        instance_variables.each do |instance_variable|
          key = instance_variable.to_s.gsub(/@/) { "" }.to_sym
          attrs[key] = instance_variable_get(instance_variable)
        end
        attrs
      end
    end
  end
end
