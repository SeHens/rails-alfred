class RemoveFavoriteFromStartups < ActiveRecord::Migration[7.1]
  def change
    remove_column :startups, :favorite, :boolean
  end
end
