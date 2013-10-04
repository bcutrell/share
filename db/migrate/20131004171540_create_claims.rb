class CreateClaims < ActiveRecord::Migration
  def change
    create_table :claims do |t|
      t.integer :item_id
      t.integer :user_id

      t.timestamps
    end
  end
end
