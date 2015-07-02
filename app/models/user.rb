class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :username, presence: true, uniqueness: true, length: { minimum: 4, maximum: 20 }

  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :trackable,
         :validatable
end
