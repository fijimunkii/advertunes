class User < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :sc_id
      t.string :sc_username
      t.string :sc_access_token
      t.string :sc_refresh_token
      t.datetime :sc_expires_at

      t.timestamps
    end
  end
end
