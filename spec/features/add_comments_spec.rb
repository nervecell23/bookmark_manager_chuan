feature 'Add comment to bookmarks' do
  # scenario '- user can add comment to a bookmark' do
  #   visit('/bookmarks')
  #   add_two_entries
  #   first('.each_entry').click_button('Comment')
  #   expect(page).to have_field('comment')
  #   expect(page).to have_field('usrname')
  #   expect(page).to have_button('Submit comment')
  # end
  #
  #
  # scenario '- added comment to be displayed in homepage' do
  #   visit('/bookmarks')
  #   add_two_entries
  #   first('.each_entry').click_button('Comment')
  #   fill_in('usrname', with: 'randomname')
  #   fill_in('comment', with: 'this is some random comment')
  #   click_button('Submit comment')
  #
  #   within('li', class:each_entry, id:entry_1) do
  #     expect(page).to have_content('this is some random comment')
  #   end
  # end
end
