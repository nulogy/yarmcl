require "psych"

module YARMCL
  module Definitions
    module Reader
      module_function

      def read(*path_elements)
        definitions_file = File.join(*path_elements)

        Psych.load_file(definitions_file)
      end
    end
  end
end
