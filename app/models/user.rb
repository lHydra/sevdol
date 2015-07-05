class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :role

  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :trackable,
         :validatable

  def role?(name)
    if role_id == 1 && name == 'admin'
      return true
    else
      return false
    end
  end
end
