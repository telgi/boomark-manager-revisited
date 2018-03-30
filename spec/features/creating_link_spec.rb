feature 'Creating Link' do
  scenario 'User can add a new link' do
    visit '/posts/new'
    fill_in('url', with: 'https://www.theguardian.com/')
    fill_in('title', with: 'Guardian')
    click_button('Submit')

    expect(page).to have_content('https://www.theguardian.com/')
  end
end
