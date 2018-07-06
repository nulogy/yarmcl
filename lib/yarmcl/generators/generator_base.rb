module YARMCL
  module Generators
    class GeneratorBase
      attr_reader :data_definition

      def initialize(data_definition)
        @data_definition = data_definition
      end

      def generate
        raise NotImplementedError
      end
    end
  end
end
