class RenameHqCountryToHqLocationInStartups < ActiveRecord::Migration[7.1]
  def change
    rename_column :startups, :hq_country, :hq_location
  end
end
