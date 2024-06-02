class ChangeColumnTypeInStartup < ActiveRecord::Migration[7.1]
  def change
    change_column :startups, :total_funding, :float
  end
end
