# Acceptance tests for the CatalogGenerator
# This ensures that a basic catalog of models can be generated

require "spec_helper"

module YARMCL
  module Generators
    RSpec.describe "Catalog Generator" do
      let(:catalog_generator) { CatalogGenerator.new(generator_library) }
      let(:generator_library) { { product: product_generator } }
      let(:product_generator) { ProductGenerator.new }

      it "generates simple product model" do
        catalog_generator.generate_catalog

        expect(product_generator.products.length).to eq(1)
      end
    end

    class ProductGenerator < SimpleGenerator
      attr_reader :products

      def initialize
        @products = ["TODO, I SHOULD BE AN EMPTY ARRAY"]
      end

      private

      def generate_instance(product_definition)
        products.push(product_definition)
      end

      def instance_definitions
        data_definition.read("catalog", "product.yml")
      end
    end
  end
end
