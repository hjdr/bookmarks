
feature 'validates url' do
  scenario 'it raises an error if the  url is in the incorrect format' do
    visit('/')
    click_button('Create Bookmark')
    fill_in 'url', with: 'www.incorrect-format.com'
    fill_in 'title', with: 'Incorrect URL'
    click_button('Add Bookmark')
    expect(page).to have_content('Incorrect format! Please ensure the domain is predicated with -> https://www.')
  end
end
