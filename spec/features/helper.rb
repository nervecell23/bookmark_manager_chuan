def add_two_entries
  fill_in('title', with: 'random_title_1')
  fill_in('url', with: 'http://www.random1.com')
  click_button('Add')
  fill_in('title', with: 'random_title_2')
  fill_in('url', with: 'http://www.random2.com')
  click_button('Add')
end
