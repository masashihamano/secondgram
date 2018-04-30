class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :topic, foreign_key: true
      t.text :body

      # t.integer :user_id
      # t.integer :topic_id

      t.timestamps
    end
  end
end
