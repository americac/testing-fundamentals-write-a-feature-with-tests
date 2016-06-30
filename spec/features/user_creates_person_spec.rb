require "rails_helper"

feature "user creates person" do
  scenario "with valid data" do
    visit new_person_path
    fill_in "person_first_name", with: "Coach"
    click_button "Create Person"

    expect(page).to have_content("Person created")
  end
end


feature "user edits existing person" do
  scenario "with valid data" do
    person = Person.create(:first_name => 'Leo')
    visit ('/people/' + person.id.to_s)
    click_link "Edit"
    expect(page).to have_content("Edit "+ person.first_name)
    find_button('Update Person').visible?
  end
end
