module YARMCL
  module Generators
    class GeneratorEntry
      attr_reader :name, :generator

      def initialize(name, generator)
        @name = name
        @generator = generator
      end
    end
  end
end
