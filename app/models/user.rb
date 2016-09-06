# User model
class User < ActiveRecord::Base
  # Others available are:
  # :confirmable, :lockable, :timeoutable, :recoverable, :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  # Custom validations
  validates :firstname, presence: true
  validates :lastname,  presence: true
  validates :username,  presence: true
end
