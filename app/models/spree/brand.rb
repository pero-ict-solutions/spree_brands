class Spree::Brand < ActiveRecord::Base
  attr_accessible :description, :name, :logo

  has_attached_file :logo, :styles => {:thumb => "100x100>" }
end
