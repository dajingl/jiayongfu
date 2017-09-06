class CreatePosters < ActiveRecord::Migration[5.1]
  def change
    create_table :posters do |t|
      t.string :title
      t.string :main_photo
      t.integer :rank

      t.timestamps
    end
  end
end
