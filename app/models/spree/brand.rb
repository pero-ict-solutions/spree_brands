class Spree::Brand < ActiveRecord::Base
  attr_accessible :description, :name, :logo, :enabled
  has_attached_file :logo, :styles => {:thumb => "100x100>" }
  acts_as_url :name

  has_many :products, :class_name => "Spree::Product", :foreign_key => "brand_id"

  def self.active
    where(enabled: true)
  end

  def to_param
    url
  end

end
