require 'rails_helper'
require 'support/factory_girl'

feature 'HomePage' do
  let(:user) { create(:user) }
  background { visit home_index_path }

  context 'when email and password are valid' do
    background do
      3.times { create :book }
    end
    scenario 'logs user in' do
      within 'form#new_user' do
        fill_in 'email', with: user.email
        fill_in 'password', with: user.password
        click_button 'Log in'
      end
      expect(page).to have_text 'Signed in successfully'
      expect(page).not_to have_content 'Enter Email'
      expect(page).not_to have_content 'Password'
      expect(page).not_to have_button 'Log in'
    end
  end

  context 'when password is invalid' do
    scenario "doesn't log user in" do
      within 'form#new_user' do
        fill_in 'email', with: user.email
        fill_in 'password', with: (user.password + '1')
        click_button 'Log in'
      end
      expect(page).to have_text 'Invalid Email or password'
      expect(page).not_to have_text 'Signed in successfully'
      expect(page).to have_content 'Enter Email'
      expect(page).to have_content 'Password'
      expect(page).to have_button 'Log in'
    end
  end
end
