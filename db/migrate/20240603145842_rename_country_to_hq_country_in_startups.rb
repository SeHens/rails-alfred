class RenameCountryToHqCountryInStartups < ActiveRecord::Migration[7.1]
  def change
    rename_column :startups, :country, :hq_country
  end
end
