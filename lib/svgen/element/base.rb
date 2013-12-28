module SVGen
  module Element
    class Base
      def generate(svg)
        raise NotImplementedError.new("Subclass must override SVGen::Element::Base#generate")
      end
    end
  end
end
