feature 'Viewing Links' do
  scenario 'allows user to view all links' do
    visit '/posts'

    expect(page).to have_content('https://www.reddit.com')
    expect(page).to have_content('https://www.buzzfeed.com')
    expect(page).to have_content('www.bbc.co.uk/news')
  end
end
