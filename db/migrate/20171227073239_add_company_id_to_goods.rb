class AddCompanyIdToGoods < ActiveRecord::Migration[5.1]
  def change
    add_column :goods, :company_id, :integer
  end
end
