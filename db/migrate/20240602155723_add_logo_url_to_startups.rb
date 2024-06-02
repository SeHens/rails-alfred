class AddLogoUrlToStartups < ActiveRecord::Migration[7.1]
  def change
    add_column :startups, :logo_url, :string
  end
end
