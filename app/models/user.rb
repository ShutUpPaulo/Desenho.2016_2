class User < ActiveRecord::Base
  # Others available are:
  # :confirmable, :lockable, :timeoutable, :recoverable, :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  # Custom validations
  # validate(:validate_username)

  # private
  #   # Fix the conflict between username and email
  #   def validate_username
  #     if User.where(email: username).exists?
  #       errors.add(:username, :invalid)
  #     end
  #   end
end
