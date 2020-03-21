class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :beta_key

#i'm not sure if those google_tokens are actually working or not
      t.string :google_token
      t.string :google_refresh_token
      t.timestamps
    end
  end
end
