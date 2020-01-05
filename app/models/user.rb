# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  avatar_file     :text
#  avatar_url      :string
#

class User < ApplicationRecord
  include AuthUtil::Jwt

  before_validation :set_avatar
  before_save { email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password

  def update_avatar(email = self.email)
    unless Rails.env.test?
      avatar_data = AvatarCreatorService.call(email)
      self.avatar_url = avatar_data[:url]
      if (avatar_data[:svg])
        self.avatar_file = avatar_data[:svg]
      end
    end
  end

  def update_avatar!
    self.update_avatar
    self.save!
  end

  private
    def set_avatar
      unless(self.avatar_url.present?)
        self.update_avatar
      end
    end
end
