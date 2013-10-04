class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :title,  null: false
      t.string :location,  null: false
      t.text :description
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end
end
