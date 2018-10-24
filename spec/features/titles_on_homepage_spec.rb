feature 'titles on homepage' do
  scenario 'user can see a list of titles on homepage' do
    visit('/diary_entries')
    click_link("New Entry")
    fill_in(:title, with: "Week 1 at Makers")
    click_button("Save")
    click_link("New Entry")
    fill_in(:title, with: "Week 2 at Makers")
    click_button("Save")
    expect(page).to have_content("Week 1 at Makers")
    expect(page).to have_content("Week 2 at Makers")
  end

  # scenario 'user can click on a title to see the full Diary Entry' do
  #   visit('/diary_entries')
  #   click_link("New Entry")
  #   fill_in(:title, with: "Week 1 at Makers")
  #   fill_in(:body, with: "OOD")
  #   click_button("Save")
  #   click_link("Week 1 at Makers")
  #   expect(page).to have_content("Week 1 at Makers")
  #   expect(page).to have_content("OOD")
  # end
end
