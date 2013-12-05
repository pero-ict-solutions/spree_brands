class Spree::BrandsController < Spree::BaseController
  helper :all

  def show
    @brand = Spree::Brand.where(url: params[:id]).active.first || brand_not_enabled_or_found
    @products = @brand.products.active
  end

  protected
    def brand_not_enabled_or_found
      raise ActionController::RoutingError.new('Not Found')
    end
end
