# Acceptance tests for the CatalogGenerator
# This ensures that a basic catalog of models can be generated

require "spec_helper"

module YARMCL
  module Generators
    RSpec.describe "Catalog Generator" do
      let(:catalog_generator) { CatalogGenerator.new(generator_library) }
      let(:generator_library) do
        [
          GeneratorEntry.new(:customers, customer_generator),
          GeneratorEntry.new(:products, product_generator)
        ]
      end
      let(:customer_generator) { CustomerGenerator.new }
      let(:product_generator) { ProductGenerator.new }

      describe "generating an entire catalog" do
        let(:catalog) { catalog_generator.generate_catalog }

        it "only generates models that we have configured" do
          expect(catalog.keys).to contain_exactly(:customers, :products)
        end

        it "generates simple customer models" do
          expect(catalog[:customers]).to have_attributes(
            coca_cola: a_hash_including(
              name: "Coca-Cola",
              city: "Atlanta"
            )
          )
        end

        it "generates product models that have relationships" do
          expect(catalog[:products]).to have_attributes(
            coke_zero: a_hash_including(
              code: "CKE-ZRO",
              brand: "Coke Zero",
              customer: "Coca-Cola",
              description: a_string_matching("Aspartame!")
            )
          )
        end
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
