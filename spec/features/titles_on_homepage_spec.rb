feature 'titles on homepage' do
  scenario 'user can see a list of titles on homepage' do
    visit('/')
    click_link("New Entry")
    fill_in(:title, with: "Week 1 at Makers")
    click_button("Save")
    click_link("New Entry")
    fill_in(:title, with: "Week 2 at Makers")
    click_button("Save")
    expect(page).to have_content("Week 1 at Makers")
    expect(page).to have_content("Week 2 at Makers")
  end
end
