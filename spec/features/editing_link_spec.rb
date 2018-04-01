feature 'Edit Link' do
  scenario 'User is able to update a link' do
    visit '/links'
    within '#link-1' do
      click_link 'Edit'
    end

    fill_in('url', with: 'https://www.breddit.com')
    fill_in('title', with: 'Breddit')
    click_button 'Update'

    expect(current_path).to eq '/links'
    expect(page).not_to have_content 'Reddit'
    expect(page).to have_content 'Breddit'
  end
end
