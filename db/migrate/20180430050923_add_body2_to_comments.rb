class AddBody2ToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :body2, :text
  end
end
