class AddUrlColumnToBrands < ActiveRecord::Migration
  def change
    add_column :spree_brands, :url, :string
  end
end
