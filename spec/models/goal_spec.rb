require 'rails_helper'

RSpec.describe Goal, type: :model do
  it {should validate_presence_of(:body)}
  it {should validate_presence_of(:user)}
  it {should validate_presence_of(:title)}
  it {should validate_length_of(:priv).is_at_most(1)}
  it {should validate_length_of(:completed).is_at_most(1)}

  it{ should belong_to(:user)}
end
