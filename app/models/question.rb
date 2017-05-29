class Question < ApplicationRecord
  validates :body, presence: true

  belongs_to :user
  has_many :answers
end
