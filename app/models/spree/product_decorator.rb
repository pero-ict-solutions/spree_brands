Spree::Product.class_eval do
  attr_accessible :brand_id
  belongs_to :brand, :class_name => "Spree::Brand", :foreign_key => "brand_id"

  def self.by_brand(brand_id)
    where(brand_id: brand_id)
  end

  def self.with_active_brands
    joins(:brand).where(spree_brands: { enabled: true})
  end

end