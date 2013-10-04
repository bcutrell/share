class AddStateToGoods < ActiveRecord::Migration
  def change
    add_column :goods, :state, :string
  end
end
