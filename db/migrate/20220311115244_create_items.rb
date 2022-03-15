class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :price
      t.text :content
      t.integer :schedule_id 
      t.references :user
      t.integer :ship_fee_id
      t.integer :category_id
      t.integer :item_status_id
      t.integer :prefecture_id
      
      t.timestamps
    end
  end
end
