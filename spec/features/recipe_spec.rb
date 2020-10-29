require 'rails_helper'

describe 'RecipesController', :vcr, type: :feature do
  it "GET index" do
    visit '/recipes'
    expect(page).to have_xpath("//a[contains(.,'White Cheddar Grilled Cheese')]")
  end

  it "GET show" do
    visit '/recipes/4dT8tcb6ukGSIg2YyuGEOm'
    expect(page).to have_xpath("//*[contains(.,'White Cheddar Grilled Cheese')]")
    expect(page).to have_xpath("//*[contains(.,'vegan')]")
    expect(page).to have_xpath("//*[contains(.,'Grilled Cheese 101')]")
  end

  it "GET 404" do
    visit '/recipes/123'
    expect(page).to have_xpath("//*[contains(.,'Oops! Not found')]")
  end
end