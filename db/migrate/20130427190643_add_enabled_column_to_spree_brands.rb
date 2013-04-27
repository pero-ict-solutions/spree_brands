class AddEnabledColumnToSpreeBrands < ActiveRecord::Migration
  def change
    add_column :spree_brands, :enabled, :boolean, :default => true
  end
end
