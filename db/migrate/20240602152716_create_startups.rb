class CreateStartups < ActiveRecord::Migration[7.1]
  def change
    create_table :startups do |t|
      t.string :name
      t.string :homepage_url
      t.string :industry
      t.string :country
      t.integer :total_funding
      t.boolean :favorite

      t.timestamps
    end
  end
end
