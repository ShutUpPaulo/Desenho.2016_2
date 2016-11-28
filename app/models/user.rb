# User model
class User < ActiveRecord::Base
  # Others available are:
  # :confirmable, :lockable, :timeoutable, :recoverable, :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  # Custom validations
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :username
  validates_uniqueness_of :username

  # Define roles
  belongs_to :role
  before_create :set_default_role
  def role?(role)
    return false if self.role.nil?
    self.role.name == role
  end

  # Associate users and recipes
  has_many :recipes

  private

  def set_default_role
    self.role ||= Role.find_by_name('cook')
  end
end
