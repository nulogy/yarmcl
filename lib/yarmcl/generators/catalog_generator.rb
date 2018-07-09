module YARMCL
  module Generators
    class CatalogGenerator
      # This will be the entry point for catalog generation
      def initialize(generator_library)
        @generator_library = generator_library
      end

      def generate_catalog
        Hash[generator_library.map do |generator_entry|
          [generator_entry.name, generator_entry.generator.generate]
        end]
      end

      private

      attr_reader :generator_library
    end
  end
end
