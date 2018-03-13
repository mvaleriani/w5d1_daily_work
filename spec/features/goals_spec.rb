require 'spec_helper'
require 'rails_helper'

feature 'creating a goal' do
  before :each do
    User.create!(username: 'penelope', password: 'abcd1234')
    visit new_session_path
    user = User.find_by(username: 'penelope')
    fill_in 'Username', with: 'penelope'
    fill_in 'Password', with: 'abcd1234'
    click_button 'Sign In'
  end
  scenario 'user signed in and can add a goal' do
    fill_in 'Title', with: 'Marathon'
    fill_in 'Body', with: 'Under 30sec!'
    click_button 'Add Goal'

    goal = Goal.find_by(title: 'Marathon')
    expect(current_path).to eq(goal_path(goal))
    expect(page).to have_content('Under 30sec!')

  end
end

feature 'the show process' do

end

feature 'the edit/update process' do

end

feature 'the destroy process' do

end
