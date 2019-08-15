def add_two_entries
  fill_in('title', with: 'random_title_1')
  fill_in('url', with: 'random_url_1')
  click_button('Add')
  fill_in('title', with: 'random_title_2')
  fill_in('url', with: 'random_url_2')
  click_button('Add')
end
