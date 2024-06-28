class AddDetailsToStartups < ActiveRecord::Migration[7.1]
  def change
    add_column :startups, :top_3_investors, :string
    add_column :startups, :last_funding, :float
    add_column :startups, :funding_date, :date
    add_column :startups, :cb_link, :string
  end
end
