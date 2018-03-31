feature 'Viewing Links' do
  scenario 'allows user to view all links' do
    visit '/links'

    expect(page).to have_content('Reddit')
    expect(page).to have_content('Buzzfeed')
    expect(page).to have_content('BBC News')
  end
end
