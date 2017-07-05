class RenameModelToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_table :models, :users
  end
end
