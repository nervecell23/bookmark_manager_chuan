require 'pg'
require 'spec_helper'

feature 'view bookmarks' do
  scenario '- user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks VALUES(1, 'randomtitle', 'http://www.google.com');")
    visit('/bookmarks')
    # expect(page).to have_content('http://www.makersacademy.com')
    # expect(page).to have_content('http://www.twitter.com')
    expect(page).to have_content('randomtitle')
  end

end
