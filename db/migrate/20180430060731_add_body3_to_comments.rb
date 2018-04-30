class AddBody3ToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :body3, :text
  end
end
