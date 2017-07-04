class BrightIdea < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liking_users, :through => :likes, :source => :user

# validations - idea must be present and at least 10 characters
  validates :idea, presence: true, length: {minimum: 10}

end
