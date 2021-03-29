require 'rails_helper'

RSpec.describe 'UserSignIns', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'signs in valid user' do
    user = User.create(name: 'user1')
    visit root_url
    click_link_or_button 'Login'
    fill_in 'session[name]', with: user.name
    click_link_or_button 'Login'
    expect(page).to have_css('img.avatar', count: 1)
  end
  it 'signs out logged in user' do
    user = User.create(name: 'user1')
    visit root_url
    click_link_or_button 'Login'
    fill_in 'session[name]', with: user.name
    click_link_or_button 'Login'
    expect(page).to have_css('img.avatar', count: 1)
    click_link_or_button 'Logout'
    expect(page).to have_css('h1.home-heading', count: 1, text: 'Group My Expenses')
  end
end
