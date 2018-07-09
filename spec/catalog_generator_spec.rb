# Acceptance tests for the CatalogGenerator
# This ensures that a basic catalog of models can be generated

require "spec_helper"

module YARMCL
  module Generators
    RSpec.describe "Catalog Generator" do
      let(:catalog_generator) { CatalogGenerator.new(generator_library) }
      let(:generator_library) do
        {
          products: product_generator,
          customers: customer_generator
        }
      end
      let(:product_generator) { ProductGenerator.new }
      let(:customer_generator) { CustomerGenerator.new }

      it "generates simple product model" do
        catalog = generate_catalog

        expect(catalog.keys).to contain_exactly(:customers, :products)
        expect(catalog[:products]).to have_attributes(
          coke_zero: a_hash_including(
            code: "CKE-ZRO",
            brand: "Coke Zero",
            customer: "Coca-Cola",
            description: a_string_matching("Aspartame!")
          )
        )
        expect(catalog[:customers]).to have_attributes(
          coca_cola: a_hash_including(
            name: "Coca-Cola",
            city: "Atlanta"
          )
        )
      end

      def generate_catalog
        catalog_generator.generate_catalog
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

    class CustomerGenerator < SimpleGenerator
      private

      def generate_instance(customer_definition)
        customer_definition.transform_keys(&:to_sym)
      end

      def instance_definitions
        data_reader.read(__dir__, "catalog", "customer.yml")
      end
    end
  end
end
