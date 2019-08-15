require 'pg'
require 'spec_helper'

feature 'Add url' do
  scenario 'can add new url' do
    visit('/bookmarks')
    fill_in('title', with: 'random_title')
    fill_in('url', with: 'http://www.random.com')
    click_button 'Add'
    # expect(page).to have_button('Add')
    expect(page).to have_content("random_title")
    expect(page).to have_link("random_title", href:"http://www.random.com")
   end
end
