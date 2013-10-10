class Group < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password

  has_many :users, through: :group_memberships
  
  has_many :group_memberships,
  inverse_of: :group

  has_many :goods 

  validates_presence_of :name
  validates_presence_of :password 

    def encrypt_password
      if password.present?
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      end
    end


  class << self
    def member_of(user)
      member_groups = []
      self.all.each do |group|
        if group.users.include?(user)
          member_groups << group 
        end
      end
      member_groups
    end
  end

end
