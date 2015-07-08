class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :rememberable,
         :trackable,
         :validatable

  def admin?
    role_id == 1
  end
end
