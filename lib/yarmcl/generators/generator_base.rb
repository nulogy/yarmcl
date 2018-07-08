module YARMCL
  module Generators
    class GeneratorBase
      attr_reader :data_reader

      def initialize(data_reader = YARMCL::Definitions::Reader)
        @data_reader = data_reader
      end

      def generate
        raise NotImplementedError
      end
    end
  end
end
