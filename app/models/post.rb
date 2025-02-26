class Post < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :likes, dependent: :destroy

  validates_associated :author
  validates :title, presence: true, length: { maximum: 280 }
end
