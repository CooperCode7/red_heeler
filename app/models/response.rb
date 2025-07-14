class Response < ApplicationRecord
  belongs_to :user
  belongs_to :form

  validates :user_id, uniqueness: { scope: [ :form_id, :date ], message: "Has already submitted a response for this form today" }
end
