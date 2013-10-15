class ChangePasswordColumns < ActiveRecord::Migration
  
  class Group < ActiveRecord::Base; end

  def change
    remove_column :groups, :password_hash
    remove_column :groups, :password_salt
    add_column :groups, :password_digest, :string
  end
end
