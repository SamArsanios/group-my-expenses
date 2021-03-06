require 'rails_helper'

RSpec.describe 'UserSignUps', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'signs up user' do
    visit root_url
    click_link_or_button 'Signup'
    fill_in 'user[name]', with: 'user1'
    click_link_or_button 'Signup'
    expect(page).to have_css('img.avatar', count: 1)
  end

  it "can't sign up user that already exists" do
    user = User.create(name: 'user1')
    visit root_url
    click_link_or_button 'Signup'
    fill_in 'user[name]', with: user.name
    click_link_or_button 'Signup'
    expect(page).not_to have_css('img.avatar', count: 1)
    expect(page).to have_css('.alert.alert-danger', count: 1)
  end
end
