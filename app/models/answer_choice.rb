class AnswerChoice < ApplicationRecord
  belongs_to :question
  default_scope { order(:position) }

  validates :option, presence: true
  validates :position, numericality: { only_integer: true }, allow_nil: true
end
