class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :goods, inverse_of: :user

  has_many :groups, through: :group_memberships

  has_many :group_memberships,
  inverse_of: :user 

end
