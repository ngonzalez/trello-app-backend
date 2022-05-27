class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :name, null: false
      t.string :item_id, null: false
      t.string :list_id, null: false
      t.string :desc, null: false
      t.integer :pos, null: false
      t.datetime :due, null: false
      t.datetime :start, null: false
      t.boolean :due_complete, null: false
      t.index [:item_id], name: :index_cards_on_item_id

      t.timestamps
    end
  end
end
