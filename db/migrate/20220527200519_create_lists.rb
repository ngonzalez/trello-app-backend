class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.string :name, null: false
      t.string :item_id, null: false
      t.string :board_id, null: false
      t.boolean :closed, null: false
      t.index [:item_id], name: :index_lists_on_item_id

      t.timestamps
    end
  end
end
