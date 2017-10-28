require "rails_helper"
feature "A guest visits the site" do
  context "and goes to the new user page" do
    scenario "creates a new account" do
      username = Faker::Internet.user_name
      email = Faker::Internet.email
      password = Faker::Internet.password
      name = Faker::FamilyGuy.character

      visit new_user_path

      fill_in "user[name]", with: name
      fill_in "user[username]", with: username
      fill_in "user[email]", with: email
      fill_in "user[password]", with: password

      click_on "Create Account"

      expect(page).to have_content(username)
      expect(page).to have_content("#{username}'s Page")
      expect(current_path).to eq("/users/#{User.last.id}")
    end
  end
end
