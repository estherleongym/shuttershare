class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email_address
      t.string :password_digest
      t.string :profile_description
      t.string :display_picture

      t.timestamps
    end
  end
end
