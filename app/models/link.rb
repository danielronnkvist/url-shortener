class Link < ApplicationRecord
  belongs_to :user
  validates :original, :user_id, presence: true
end
