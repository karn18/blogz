class CreateAccessTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :access_tokens, id: :uuid do |t|
      t.string :token, null: false, unique: true
      t.references :user, type: :uuid, null: false
      t.datetime :expiry_at, null: false
      t.timestamps
    end
  end
end
