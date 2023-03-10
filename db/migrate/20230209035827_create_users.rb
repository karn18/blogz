class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :username
      t.string :password_digest
      t.boolean :actived
      t.datetime :actived_at
      t.timestamps
    end
  end
end
