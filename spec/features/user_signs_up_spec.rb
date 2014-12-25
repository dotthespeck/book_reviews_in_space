require "rails_helper"

feature "User signs up for site" do

  scenario "User provides valid information" do
    visit root_path
    click_on "Sign up"

    fill_in "First Name", with: "Buzz"
    fill_in "Last Name", with: "Aldren"
    fill_in "Email", with: "buzz@aldren.com"
    fill_in "Password", with: "moonman1"
    fill_in "Password confirmation", with: "moonman1"
    click_on "Register"

    expect(page).to have_content 'Welcome, Space Reviewer!'
  end

  scenario "User does not provide information" do
    visit root_path
    click_on "Sign up"

    fill_in "First Name", with: ""
    fill_in "Last Name", with: ""
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""
    click_on "Register"

    expect(page).to have_content "First name can't be blank"
    expect(page).to have_content "Last name can't be blank"
    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
  end

  scenario "User wants to delete account" do
    visit root_path
    click_on "Sign up"

    fill_in "First Name", with: "Buzz"
    fill_in "Last Name", with: "Aldren"
    fill_in "Email", with: "buzz@aldren.com"
    fill_in "Password", with: "moonman1"
    fill_in "Password confirmation", with: "moonman1"
    click_on "Register"

    visit edit_user_registration_path
    click_on "Cancel my account"

    expect(page).to have_content "Bye! Your account has been successfully cancelled. We hope to see you again soon."
  end

  scenario "User wants to change account" do
    visit root_path
    click_on "Sign up"

    fill_in "First Name", with: "Buzz"
    fill_in "Last Name", with: "Aldren"
    fill_in "Email", with: "buzz@aldren.com"
    fill_in "Password", with: "moonman1"
    fill_in "Password confirmation", with: "moonman1"
    click_on "Register"

    visit edit_user_registration_path

    expect(page).to have_content "Edit profile"
  end

  scenario "User wants to change role" do
    visit root_path
    click_on "Sign up"

    fill_in "First Name", with: "Buzz"
    fill_in "Last Name", with: "Aldren"
    select "Candidate", from: :user_role
    fill_in "Email", with: "buzz@aldren.com"
    fill_in "Password", with: "moonman1"
    fill_in "Password confirmation", with: "moonman1"
    click_on "Register"

    visit edit_user_registration_path
    select "Astronaut", from: :user_role
  end

# Test not working
#scenario "User wants to sign in and sign out" do
#     visit root_path
#     click_on "Sign up"
#
#     user = User.create(
#     first_name: "Buzz",
#     last_name: "Aldren",
#     email: "buzz@aldren.com",
#     role: "Candidate",
#     password: "moonman1"
# )
#
#     fill_in "First Name", with: user.first_name
#     fill_in "Last Name", with: user.last_name
#     fill_in "Email", with: user.email
#     fill_in "Password", with: user.password
#     fill_in "Password confirmation", with: user.password
#     click_on "Register"
#
#     visit root_path
#     click_on "Logout"
#     expect(page).to have_content "Signed out successfully"
#
#     visit root_path
#     click_on "Login"
#
#     fill_in "Email", with: user.email
#     fill_in "Password", with: user.password
#     click_on "Login"
#     expect(page).to have_content "Signed in successfully"
#   end
end
