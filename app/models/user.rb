class User < ApplicationRecord
  has_many :forms
  has_many :answers
end
