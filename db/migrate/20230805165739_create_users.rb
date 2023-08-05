class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :userName
      t.string :email
      t.string :password_hash
      t.string :profile_picture_url
      t.boolean :is_admin
      t.timestamps
    end
  end
end
