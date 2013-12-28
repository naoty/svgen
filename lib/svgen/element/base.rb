module SVGen
  module Element
    class Base
      def generate(svg)
        raise NotImplementedError.new("Subclass must override #generate")
      end
    end
  end
end
