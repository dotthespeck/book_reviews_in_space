require "rails_helper"

feature "User signs up for site" do

  scenario "User provides valid information" do
    user = FactoryGirl.build(:user)

    visit root_path
    click_on "Sign up"

    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: user.last_name
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
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

    user = FactoryGirl.build(:user)

    visit root_path
    click_on "Sign up"

    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: user.last_name
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_on "Register"

    visit edit_user_registration_path
    click_on "Cancel my account"

    expect(page).to have_content "Bye! Your account has been successfully cancelled. We hope to see you again soon."
  end

  scenario "User wants to change account" do

    user = FactoryGirl.build(:user)

    visit root_path
    click_on "Sign up"

    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: user.last_name
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_on "Register"

    visit edit_user_registration_path

    expect(page).to have_content "Edit profile"
  end

  scenario "User wants to change role" do

    user = FactoryGirl.build(:user)

    visit root_path
    click_on "Sign up"

    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: user.last_name
    select "Candidate", from: :user_role
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_on "Register"

    visit edit_user_registration_path
    select "Astronaut", from: :user_role
  end


scenario "User wants to sign out" do
    visit root_path
    click_on "Sign up"

    user = FactoryGirl.build(:user)

    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: user.last_name
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password

    click_on "Register"

    visit root_path

    click_on "Logout"
    expect(page).to have_content "Signed out successfully"

    #Still can't get login to work
    # click_on "Login"
    # fill_in "Email", with: user.email
    # fill_in "Password", with: user.password
    #
    # click_on "Login"
    #
    # expect(page).to have_content "Signed in successfully"

  end
end
