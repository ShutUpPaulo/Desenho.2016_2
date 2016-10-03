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

  # Define roles
  belongs_to :role
  before_create :set_default_role
  def role? role
    if self.role.nil?
      return false
    end
    self.role.name == role
  end

  # Associate users and recipes
  has_many :recipes

  private

  def set_default_role
    self.role ||= Role.find_by_name('cook')
  end
end
