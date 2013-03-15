class Spree::BrandsController < Spree::BaseController
  helper :all

  def show
    @brand = Spree::Brand.find_by_url(params[:id])
    @products = @brand.products.active
  end
end
