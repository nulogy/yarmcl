require "ostruct"

module YARMCL
  module Generators
    class SimpleGenerator < GeneratorBase
      def generate
        OpenStruct.new.tap do |instances|
          instance_data = instance_definitions.fetch("data")
          instance_data.each_pair do |key, value|
            instances.send("#{key}=", generate_instance(value))
          end
        end
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
