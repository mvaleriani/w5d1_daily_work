require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }


  describe 'password encryption' do
    it 'does not save passwords to the db' do
      User.create!(username: 'penelope', password: 'abcd1234')
      user = User.find_by(username: 'penelope')
      expect(user.password).not_to eq('abcd1234')
    end
  end

  describe 'ensuring session token' do
    it 'assigns session_token to user' do
      user = User.new(username: 'penelope', password: 'abcd1234')
      expect(user.session_token).not_to eq(nil)
    end
  end

  describe 'finding a user by credentials' do
    it 'finds user using username and password' do
      User.create!(username: 'penelope', password: 'abcd1234')
      user = User.find_by_credentials('penelope', 'abcd1234')
      expect(user.username).to eq('penelope')
    end

    it "returns nil for invalid credentials" do
      User.create!(username: 'penelope', password: 'abcd1234')
      user = User.find_by_credentials( 'penelope', 'abcewrgtewsd1234')
      expect(user).to eq(nil)
    end
  end
  # after_initialize ;ensure session token
  # self.session_token = SecureRandom.urlsafe_base64
  # pending "add some examples to (or delete) #{__FILE__}"
end
