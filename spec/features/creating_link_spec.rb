feature 'Creating Link' do
  scenario 'User can add a new link' do
    visit '/posts/new'
    fill_in('url', with: 'https://www.theguardian.com/')
    fill_in('title', with: 'Guardian')
    click_button('Submit')

    expect(page).to have_content('Guardian')
  end

  scenario 'The link must be a valid URL' do
    visit '/posts/new'
    fill_in('url', with: 'ww.fake-news.co')
    fill_in('title', with: 'Fake News')
    click_button 'Submit'

    expect(page).not_to have_content 'Fake News'
    expect(page).to have_content 'You must submit a valid URL'
  end
end
