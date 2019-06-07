class User < ApplicationRecord
  before_save :downcase_email
  validates :name, length: { minimum: 2, maximum: 25 },
                   uniqueness: { case_sensitive: false }
  validates :email, presence: true,
                    length: { maximum: 250 },
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def self.digest(string)
    BCrypt::Password.create(string)
  end

  private

    def downcase_email
      self.email.downcase!
    end
end
