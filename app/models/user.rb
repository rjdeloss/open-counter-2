# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  first_name      :string           not null
#  last_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :session_token, :password_digest, presence: true

  after_initialize :generate_session_token

  attr_reader :password

    has_many :reservations
    has_many :favorites
    has_many :reviews

    has_many :reserved_restaurants,
        through: :reservations,
        source: :restaurant

    has_many :favorite_restaurants,
        through: :favorites,
        source: :restaurant

    has_many :reviewed_restaurants,
        through: :reviews,
        source: :restaurant

    def password=(password)
      @password = password
      self.password_digest = BCrypt::Password.create(password)
    end

    def is_passoword?(password)
      BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def self.find_by_credentials(email, password)
      user = User.find_by(email: email)
      user && user.is_passoword?(password) ? user : nil
    end

    def reset_session_token!
      self.session_token = SecureRandom.urlsafe_base64
      self.save!
      self.session_token
    end

    private

    def generate_session_token
      self.session_token ||= SecureRandom.urlsafe_base64
    end

    def full_name
      "#{first_name} #{last_name}"
    end
end
