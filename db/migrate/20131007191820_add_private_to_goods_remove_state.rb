class AddPrivateToGoodsRemoveState < ActiveRecord::Migration

  class Good < ActiveRecord::Base; end

  def up
    add_column :goods, :private, :boolean, null: :false, default: :false 
    Good.find_each do |good|
      if good.state == "posted"
        good.private = false 
      elsif good.state == "public"
        good.private = false
      elsif good.state == "private"
        good.private = true
      end
      good.save
    end
    remove_column :goods, :state
  end

  def down 
    add_column :goods, :state, :string 
    Good.find_each do |good|
      if good.private 
        good.state = "private"
      else  
        good.state = "public"
      end
      good.save
    end
    remove_column :goods, :private
  end
end
