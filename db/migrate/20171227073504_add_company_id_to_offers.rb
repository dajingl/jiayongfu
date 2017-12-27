class AddCompanyIdToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :company_id, :integer
  end
end
