class AddAbstractionToGoods < ActiveRecord::Migration[5.1]
  def change
    add_column :goods, :abstraction, :text
  end
end
