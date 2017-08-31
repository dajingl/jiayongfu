class CreateGoods < ActiveRecord::Migration[5.1]
  def change
    create_table :goods do |t|
      t.string :title
      t.text :description
      t.text :body
      t.string :main_photo
      t.integer :rank, default: 0
      t.integer :state, default: 0

      t.timestamps
    end
  end
end
