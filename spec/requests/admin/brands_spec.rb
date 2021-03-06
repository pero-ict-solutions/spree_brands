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

  it "allows for uploading an image" do
    brand = create(:brand)
    visit spree.admin_path
    click_link "Brands"
    click_link "Edit"
    absolute_path = Rails.root + "../../spec/support/logo-pero-ict.png"
    attach_file('brand_logo', absolute_path)
    click_button "Update"
    page.should have_content("successfully updated!")
  end

  it "can disable a brand" do
    brand = create(:brand)
    visit spree.admin_path
    click_link "Brands"
    click_link "Edit"
    uncheck "Enable"
    click_button "Update"
    page.should have_content("successfully updated!")
    Spree::Brand.active.should_not include(brand)
  end

end