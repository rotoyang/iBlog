class Post < ApplicationRecord
  validates :title, presence: true,
                length: { minimum: 5, maximum: 100}
  validates :desc, presence: true,
                length: { minimum: 10}
  belongs_to :user
  has_many :comments, dependent: :destroy
end