class User < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :soundcloud_id
      t.string :soundcloud_username
      t.string :soundcloud_access_token
      t.string :soundcloud_refresh_token
      t.datetime :soundcloud_expires_at

      t.timestamps
    end
  end
end
