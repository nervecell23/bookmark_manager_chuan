require 'pg'

feature 'view bookmarks' do
  scenario '- visiting index page' do
    visit('/')
    expect(page).to have_content('Bookmark Manager')
  end

  scenario '- user can see bookmarks' do

    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.google.com');")


    visit('/bookmarks')
    # expect(page).to have_content('http://www.makersacademy.com')
    # expect(page).to have_content('http://www.twitter.com')
    expect(page).to have_content('http://www.google.com')
  end
end
