class AddCommentsToStartups < ActiveRecord::Migration[7.1]
  def change
    add_column :startups, :comments, :text
  end
end
