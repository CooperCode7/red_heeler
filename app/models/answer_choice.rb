class AnswerChoice < ApplicationRecord
  belongs_to :question
  default_scope { order(:position) }
end
