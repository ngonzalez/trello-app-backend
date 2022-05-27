class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.string :name, null: false
      t.string :item_id, null: false
      t.string :url, null: false
      t.string :short_url, null: false
      t.index [:item_id], name: :index_boards_on_item_id

      t.timestamps
    end
  end
end
