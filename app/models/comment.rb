class Comment < ApplicationRecord
    validates :username, presence: true,
                length: { minimum: 3, maximum: 25}
    validates :desc, presence: true,
                length: { minimum: 10, maximum: 500}
    belongs_to :post
end