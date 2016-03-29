class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: :uuid do |t|
      t.string :email
      t.string :encrypted_password
      t.string :encrypted_password_salt
      t.string :encrypted_password_iv
      t.string :name

      t.timestamps null: false
    end
  end
end
