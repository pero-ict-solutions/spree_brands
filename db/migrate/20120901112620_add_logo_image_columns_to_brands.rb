class AddLogoImageColumnsToBrands < ActiveRecord::Migration
  def change
    add_column :spree_brands, :logo_file_name,    :string
    add_column :spree_brands, :logo_content_type, :string
    add_column :spree_brands, :logo_file_size ,   :integer
    add_column :spree_brands, :logo_updated_at,   :datetime
  end
end
