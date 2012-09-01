require 'spec_helper'

describe "Admin::Brands" do

  stub_authorization!

  it "adds a Brand tab to the admin menu" do
    visit spree.admin_path
    within(:css, '#admin-menu') { page.find_link("Brands")['/admin/brands'] }
  end

  it "add a new Brand" do
    visit spree.admin_path
    click_link "Brands"
    click_link "Add Brand"
    fill_in "Name", :with => "My Brand"
    fill_in "Description", :with => "My Brands description"
    click_button "Create"
    page.should have_content "Brand \"My Brand\" has been successfully created"
    page.should have_content "My Brand"
    page.should have_content "My Brands description"
  end

end