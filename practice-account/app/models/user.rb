class User < ApplicationRecord
  before_save :downcase_email
  validates :name, presence: true,
                   length: { minimum: 2, maximum: 25 },
                   uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 250 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  private

  def downcase_email
    self.email.downcase!
  end
end
