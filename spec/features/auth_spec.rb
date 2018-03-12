# spec/features/auth_spec.rb

require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  before :each do
    visit new_user_path
  end

  scenario 'has a new user page' do
    expect(page).to have_content('Sign Up')
  end


  feature 'signing up a user' do
    before :each do
      visit new_user_path
    end
    scenario 'shows username on the homepage after signup' do
      fill_in 'Username', with: 'penelope'
      fill_in 'Password', with: 'abcd1234'
      click_button 'Sign Up'
      expect(page).to have_content('penelope')
      user = User.find_by(username: 'penelope')
      expect(current_path).to eq(user_path(user))
    end

  end
end

feature 'logging in' do
  before :each do
    User.create!(username: 'penelope', password: 'abcd1234')
    visit new_session_path
  end
  scenario 'shows username on the homepage after login' do
    fill_in 'Username', with: 'penelope'
    fill_in 'Password', with: 'abcd1234'
    click_button 'Sign In'
    expect(page).to have_content('penelope')
    user = User.find_by(username: 'penelope')
    expect(current_path).to eq(user_path(user))
  end

end

feature 'logging out' do
  before :each do
    User.create!(username: 'penelope', password: 'abcd1234')
    visit new_session_path
    fill_in 'Username', with: 'penelope'
    fill_in 'Password', with: 'abcd1234'
  end
  
  scenario 'begins with a logged out state' do
    expect(page).to have_content('Sign In')
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    click_button 'Sign In'
    click_button 'Sign Out'

    expect(current_path).to eq(new_session_path)
    expect(page).not_to have_content('penelope')
  end

end
