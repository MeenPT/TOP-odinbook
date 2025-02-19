class Post < ApplicationRecord
  belongs_to :author, class_name: "User"

  validates_associated :author
end
