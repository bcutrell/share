class AddLatitudeAndLongitudeToGoods < ActiveRecord::Migration
  def change
    add_column :goods, :latitude, :float
    add_column :goods, :longitude, :float
  end
end
