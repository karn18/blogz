class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts, id: :uuid do |t|
      t.references :user, type: :uuid
      t.string :title
      t.text :body
      t.timestamps
    end
  end
end
