class AddDescriptionToStartups < ActiveRecord::Migration[7.1]
  def change
    add_column :startups, :description, :text
  end
end
