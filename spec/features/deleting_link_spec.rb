feature 'Deleting Link' do
  scenario 'User is able to delete a link' do
    visit '/links'

    within '#link-1' do
      click_button 'Delete'
    end

    expect(current_path).to eq '/links'
    expect(page).not_to have_content 'Reddit'
  end
end
