feature 'Edit a bookmark' do
  scenario '- enter a search page when user click edit button' do
    visit('/bookmarks')
    add_two_entries
    first('.each_entry').click_button('Edit')
    expect(page).to have_field('modified_title')
    expect(page).to have_field('modified_url')
    expect(page).to have_button('Submit')
  end

  scenario '- data of searched Bookmark is properly displayed' do
    visit('/bookmarks')
    add_two_entries
    within('li', class:"each_entry", id:"entry_1") do
      click_button('Edit')
    end 
    #first('.each_entry').click_button('Edit')
    expect(page).to have_content('random_title_1')
  end

  scenario '- show modified title and url in main page' do
    visit('/bookmarks')
    add_two_entries
    first('.each_entry').click_button('Edit')
    fill_in('modified_title', with: 'modified_title')
    fill_in('modified_url', with: 'modified_url')
    click_button('Submit')

    within('li', class:"each_entry", id:"entry_1") do
      expect(page).to have_content('modified_title')
    end
  end
end
