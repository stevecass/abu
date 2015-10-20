require 'rails_helper'

RSpec.feature 'User features' do
  let (:user) { FactoryGirl.build(:user) }

  scenario 'it registers a user' do
    visit root_path
    click_link 'Register'
    fill_in 'user_email', with: user.email
    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_button 'Create User'
    expect(page).to have_content("Hello #{user.username}")
  end

  scenario 'it re-renders registration if reg fails' do
    visit root_path
    click_link 'Register'
    fill_in 'user_email', with: user.email
    fill_in 'user_username', with: user.username
    fill_in 'user_password_confirmation', with: user.password
    click_button 'Create User'
    expect(page).to have_selector('form#new_user')
    expect(page).to have_content("Password can't be blank")
  end


end
