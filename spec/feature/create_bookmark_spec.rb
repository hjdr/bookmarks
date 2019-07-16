
feature "user creates bookmark" do
  scenario "user wants to store a favorite website" do
    visit('/')
    click_button('Create Bookmark')
    fill_in 'url', with: 'www.cockandballs.com'
    click_button('Add Bookmark')
    click_button('View Bookmarks')

    expect(page).to have_content('www.cockandballs.com')
  end
end