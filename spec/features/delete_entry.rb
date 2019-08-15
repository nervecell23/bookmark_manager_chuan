feature 'Delete entry in database' do

  scenario '- it has a field and delete button' do
    visit '/bookmarks'
    fill_in('title', with: 'random_title')
    fill_in('url', with: 'random_url')
    click_button('Add')
    expect(page).to have_button('Delete', count: 1)
  end


  scenario '- user can delete an entry' do
    visit '/bookmarks'
    fill_in('title', with: 'random_title')
    fill_in('url', with: 'random_url')
    click_button('Add')
    expect(page).to have_link('random_title', href: 'random_url')
    click_button('Delete')
    expect(page).not_to have_link('random_title', href: 'random_url')
  end

end
