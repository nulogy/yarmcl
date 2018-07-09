module YARMCL
  module Generators
    class GeneratorBase
      def initialize(data_reader = YARMCL::Definitions::Reader)
        @data_reader = data_reader
      end

      def generate
        raise NotImplementedError
      end

      protected

      attr_reader :data_reader
    end
  end
end
