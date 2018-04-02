feature 'Comment on Link' do
  scenario 'User is able to comment on a link' do
    visit '/links'

    within '#link-1' do
      click_link 'Comment'
    end

    fill_in(:text, with: 'This is a test comment')
    click_button 'Submit'

    within '#link-1' do
      expect(page).to have_content 'This is a test comment'
    end
  end
end
