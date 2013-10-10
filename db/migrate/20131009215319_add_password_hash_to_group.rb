class AddPasswordHashToGroup < ActiveRecord::Migration
  
  class Group < ActiveRecord::Base; end

  def change
    add_column :groups, :password_hash, :string 
    add_column :groups, :password_salt, :string 
    remove_column :groups, :password
  end
end
