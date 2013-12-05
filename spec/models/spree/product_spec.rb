require 'spec_helper'

describe Spree::Product do

  context "#with_active_brands" do

    let!(:brand) { create(:brand) }
    let!(:disabled_brand) {create(:brand, :enabled => false)}

    let(:product) { create(:product, :brand_id => brand.id) }
    let(:product_disabled_by_brand) { create(:product, :brand_id => disabled_brand.id) }

    it "returns the products with an active brand" do
      Spree::Product.with_active_brands.should include(product)
    end

    it "will not return the products with a disabled brand" do
      Spree::Product.with_active_brands.should_not include(product_disabled_by_brand)
    end
  end
end
