module YARMCL
  module Definitions
    class Reader
      def read(*path_elements)
        definitions_file = File.join(*path_elements)

        Psych.load_file(definitions_file)
      end
    end
  end
end
