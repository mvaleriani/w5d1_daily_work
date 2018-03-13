class Goal < ApplicationRecord
  validates :body, :title, :user, presence: true
  validates :priv, :completed, length: { maximum: 1, allow_nil: true }

  belongs_to :user

end
