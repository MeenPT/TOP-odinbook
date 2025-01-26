class Post < ApplicationRecord
  # Validation rules
  validates :text, presence: true
  validates_associated :user

  # Associations
  belongs_to :user
end
