feature 'view bookmarks' do
  scenario 'a user wants to view their list of bookmarks' do
    visit('/')
    click_button('View Bookmarks')
    expect(page).to have_content('see list of your bookmarks below')
  end
end