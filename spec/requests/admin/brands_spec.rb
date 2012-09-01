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

  it "edit a Brand" do
    brand = create(:brand)
    visit spree.admin_path
    click_link "Brands"
    click_link "Edit"
    fill_in "Name", :with => "New Brand 99"
    click_button "Update"
    page.should have_content "Brand \"New Brand 99\" has been successfully updated"
    page.should have_content "New Brand 99"
  end

  it "delete a Brand", :js => true do
    brand = create(:brand)
    visit spree.admin_path
    click_link "Brands"
    click_link "Delete"
    page.should have_content "Brand \"#{brand.name}\" has been successfully deleted"
    page.should_not have_content brand.name
  end

end