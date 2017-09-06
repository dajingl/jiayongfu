class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :Introduction
      t.string :logo
      t.string :address
      t.text :culture
      t.string :main
      t.string :qr_code

      t.timestamps
    end
  end
end
