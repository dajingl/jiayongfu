class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.string :age
      t.string :Salary

      t.timestamps
    end
  end
end
