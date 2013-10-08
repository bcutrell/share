class AddGroupIdToGoods < ActiveRecord::Migration
  def change
    add_column :goods, :group_id, :integer
  end
end
