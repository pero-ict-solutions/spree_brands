require 'spec_helper'

describe "Admin Product Brands" do
  stub_authorization!

  let!(:brand) { create(:brand) }
  let(:product) { create(:product) }

  it "assign Brand to a Product" do
    visit spree.admin_product_path(product)
    select brand.name, :from => "Brand"
    click_button "Update"
    page.has_select?('Brand', :selected => brand.name).should be_true
  end

end