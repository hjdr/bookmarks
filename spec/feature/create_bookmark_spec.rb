
feature "user creates bookmark" do
  scenario "user wants to store a favorite website" do
    visit('/')
    click_button('Create Bookmark')
    fill_in 'url', with: 'https://www.cockandballs.com'
    fill_in 'title', with: 'Chicken Tennis'
    click_button('Add Bookmark')
    click_button('View Bookmarks')

    expect(page).to have_link('Chicken Tennis', href: 'https://www.cockandballs.com')
  end
end
