feature 'reject invalid url' do

  scenario '- user input an invalid url' do
    visit('/bookmarks')
    fill_in('url', with: 'some_invalid_url')
    click_button('Add')
    expect(page).not_to have_content('some_invalid_url')
    expect(page).to have_content('Please enter valid URL')
  end
end
