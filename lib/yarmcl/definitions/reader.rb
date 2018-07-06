module YARMCL
  module Definitions
    class Reader
      def read(*path_elements)
        # TODO: Define a better way to input a particular file path
        definitions_file = Rails.root.join("example", *path_elements)

        YAML.load_file(definitions_file)
      end
    end
  end
end
