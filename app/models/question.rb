class Question < ApplicationRecord
  belongs_to :form
  validates :content, presence: true
  has_many :answers
  has_many :answer_choices, dependent: :destroy
end
