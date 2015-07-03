class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :username, presence: true, uniqueness: true, length: { minimum: 4, maximum: 20 }
  before_create :set_default_role
  belongs_to :role

  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :trackable,
         :validatable

  def role?(name)
    if role_id == 1 && name == 'admin'
      return true
    elsif role_id == 2 && name == 'registered'
      return true
    else
      return false
    end
  end

  private

  def set_default_role
    self.role_id ||= 2
  end
end
