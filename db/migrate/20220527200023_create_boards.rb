class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.string :name, null: false, unique: true
      t.string :item_id, null: false, unique: true
      t.string :url, null: false, unique: true
      t.string :short_url, null: false, unique: true
      t.datetime :deleted_at
      t.index [:item_id], name: :index_boards_on_item_id

      t.timestamps
    end
  end
end
