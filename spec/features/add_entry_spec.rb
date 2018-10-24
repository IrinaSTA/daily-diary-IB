feature 'add new diary entry' do
  scenario 'user can save a new entry title' do
    visit('/diary_entries')
    click_link("New Entry")
    fill_in(:title, with: "Week 1 at Makers")
    fill_in(:body, with: "OOD")
    click_button("Save")
    expect(page).to have_content("Week 1 at Makers")
  end
end
