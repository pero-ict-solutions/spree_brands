require 'spec_helper'

describe "Brands" do

  context "when visiting disabled brand" do
    let(:brand) { create(:brand, enabled:false) }
    it "renders a 404 when brand is disabled" do
      lambda {
        visit spree.brand_path(brand)
      }.should raise_error(ActionController::RoutingError)
    end
  end
end