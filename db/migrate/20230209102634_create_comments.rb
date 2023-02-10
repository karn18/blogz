class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments, id: :uuid do |t|
      t.references :user, type: :uuid
      t.references :post, type: :uuid
      t.text :body
      t.timestamps
    end
  end
end
