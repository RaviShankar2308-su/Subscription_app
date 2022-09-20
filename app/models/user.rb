class User < ApplicationRecord
  # :lockable, :timeoutable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :trackable,
         :omniauthable,
         omniauth_providers: [:github, :google_oauth2]

  def self.from_omniauth(access_token)
    user = User.where(email: access_token.info.email).first
    unless user
      user = User.create(
        email: access_token.info.email,
        password: Devise.friendly_token[0, 20]
      )
    end
    user.name = access_token.info.name
    user.image = access_token.info.image
    user.provider = access_token.provider
    user.uid = access_token.uid
    user.save
    user.skip_confirmation!
    user
  end
  def username
    if name?
      name
    else
      email.split(/@/).first.camelcase
    end
  end
end