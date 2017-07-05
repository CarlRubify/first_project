class AddIsPublicToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :is_public, :booleans 
  end
end
