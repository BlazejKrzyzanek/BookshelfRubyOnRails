class AddBookIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :book_id, :book
  end
end
