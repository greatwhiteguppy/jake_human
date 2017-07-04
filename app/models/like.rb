class Like < ApplicationRecord
  belongs_to :user
  belongs_to :bright_idea
  validates :user_id, uniqueness: {scope: :bright_idea_id}
end
