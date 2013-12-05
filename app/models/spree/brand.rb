class Spree::Brand < ActiveRecord::Base
  has_attached_file :logo, :styles => {:thumb => "100x100>" }
  acts_as_url :name

  has_many :products, :class_name => "Spree::Product", :foreign_key => "brand_id"

  def self.active
    where(enabled: true)
  end

  def to_param
    url
  end

  def brand_filter
    self.id.to_s
  end

  def to_filter_params(params = {})
    filter_params = params["brands"].try(:dup) || []
    if(filter_params.include?(brand_filter))
      filter_params.delete(brand_filter)
    else
      filter_params << (brand_filter)
    end
    filter_params.map {|f| "brands[]=#{f}"}.join("&")
  end

end
