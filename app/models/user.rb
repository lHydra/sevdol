class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :role

  devise :database_authenticatable,
         :rememberable,
         :trackable,
         :validatable

  def admin?
    return role_id == 1
  end
end
