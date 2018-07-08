require "ostruct"

module YARMCL
  module Generators
    class SimpleGenerator < GeneratorBase
      def generate
        OpenStruct.new.tap do |instances|
          instance_definitions.each do |instance_definition|
            tag = instance_definition.delete("tag")
            instances.send("#{tag}=", generate_instance(instance_definition))
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
