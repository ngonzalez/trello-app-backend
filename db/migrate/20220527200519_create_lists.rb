class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.integer :board_id, null: false
      t.string :name, null: false, unique: true
      t.string :item_id, null: false, unique: true
      t.boolean :closed, null: false
      t.datetime :deleted_at
      t.index [:item_id], name: :index_lists_on_item_id

      t.timestamps
    end
  end
end
