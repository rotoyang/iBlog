class ChangeArticlesToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_table :articles, :posts
    rename_column :posts, :description, :desc
  end
end
