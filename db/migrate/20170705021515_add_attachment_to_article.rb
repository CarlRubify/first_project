class AddAttachmentToArticle < ActiveRecord::Migration[5.1]
  def change
    add_attachment :articles, :image
  end
end
