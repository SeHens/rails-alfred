class AddRoundNameToStartups < ActiveRecord::Migration[7.1]
  def change
    add_column :startups, :round_name, :string
  end
end
