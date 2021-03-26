require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates user if length of name is >= 3' do
    user = User.new(name: 'user1')
    expect(user.valid?).to be true
  end

  it "doesn't validate user if length of name is < 3" do
    user = User.new(name: 'jo')
    expect(user.valid?).to be false
  end

  it 'does not validate user if name already exists' do
    User.create!(name: 'user1')
    user = User.new(name: 'user1')
    expect(user.valid?).to be false
  end
end
