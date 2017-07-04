class User < ApplicationRecord
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  before_save :normalize_email
  has_secure_password
  #bright idea association
  has_many :bright_ideas

  #like association
  has_many :likes
  has_many :liked_things, :through => :likes, :source => :bright_idea

  #validations - name & alias at least 2 characters
  # email needs regex
  # password at least 8 characters
  validates :name, :alias, presence: true, length: {minimum: 2}
  validates :email, presence: true,  format: {with: EMAIL_REGEX}, uniqueness: true, case_sensitive: false
  validates :password, presence: true, length: {minimum: 8}
  def normalize_email
    self.email.downcase!
  end
end
