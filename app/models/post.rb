class Post < ApplicationRecord
  belongs_to :author, class_name: "User"

  validates_associated :author
  validates :title, presence: true, length: { maximum: 280 }
end
