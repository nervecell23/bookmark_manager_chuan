require 'pg'
require 'spec_helper'

feature 'Add url' do
  scenario 'can add new url' do
    visit('/')
    fill_in('url', with: 'http://www.google.com')
    click_button 'Add'
    expect(page).to have_button('Add')
    expect(page).to have_content('http://www.google.com')
   end
end