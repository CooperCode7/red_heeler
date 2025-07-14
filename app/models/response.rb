class Response < ApplicationRecord
  belongs_to :user
  belongs_to :form

  validates :user_id, presence: true
  validates :form_id, presence: true

  validate :one_response_per_day

  private

  def one_response_per_day
    timestamp = created_at || Time.zone.now
    start_of_day = timestamp.beginning_of_day
    end_of_day = timestamp.end_of_day

    duplicate_exists = Response.where(
      user_id: user_id,
      form_id: form_id,
      created_at: start_of_day..end_of_day
      ).where.not(id: id).exists?

    if duplicate_exists
      errors.add(:base, "You can only submit one response per form per day")
    end
  end
end
