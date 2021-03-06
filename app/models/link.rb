class Link < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :original, presence: true, url: true
  validates :shortened, uniqueness: true
  before_validation :generate_shortened, on: :create

  private

  def generate_shortened
    begin
      self.shortened = SecureRandom.hex(self.class.count + 1).downcase
    end while self.class.exists?(shortened: shortened)
  end
end
