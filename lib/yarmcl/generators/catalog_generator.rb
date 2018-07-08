module YARMCL
  module Generators
    class CatalogGenerator
      # This will be the entry point for catalog generation
      def initialize(generator_library)
        @generator_library = generator_library
      end

      def generate_catalog
        generator_library.transform_values(&:generate)
      end

      private

      attr_reader :generator_library
    end
  end
end
