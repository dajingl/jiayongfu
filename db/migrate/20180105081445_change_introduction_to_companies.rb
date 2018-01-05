class ChangeIntroductionToCompanies < ActiveRecord::Migration[5.1]
  def change
    remove_column :companies , :Introduction, :text
    add_column :companies, :introduction, :text
  end
end
