# Acceptance tests for the CatalogGenerator
# This ensures that a basic catalog of models can be generated

require "spec_helper"

module YARMCL
  module Generators
    RSpec.describe "Catalog Generator" do
      let(:catalog_generator) { CatalogGenerator.new(generator_library) }
      let(:generator_library) { { products: product_generator } }
      let(:product_generator) { ProductGenerator.new }

      it "generates simple product model" do
        catalog = catalog_generator.generate_catalog

        expect(catalog).to include(
          products: an_object_having_attributes(
            coke_zero: a_hash_including(
              code: "CKE-ZRO",
              brand: "Coke Zero",
              customer: "Coca-Cola",
              description: a_string_matching("Aspartame!")
            )
          )
        )
      end
    end

    class ProductGenerator < SimpleGenerator
      private

      def generate_instance(product_definition)
        product_definition.transform_keys(&:to_sym)
      end

      def instance_definitions
        data_reader.read(__dir__, "catalog", "product.yml")
      end
    end
  end
end
