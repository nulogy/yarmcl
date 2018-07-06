module YARMCL
  module Generators
    class SimpleGenerator < GeneratorBase
      def generate
        puts "I don't do anything yet"
      end

      private

      def generate_instance(_instance_definition)
        raise NotImplementedError
      end

      def instance_definitions
        raise NotImplementedError
      end
    end
  end
end
