class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :avatar
      t.string :email , unique: true
      t.string :address
      t.string :phone
      t.string :password
      t.string :password_digest
      t.string :remember_digest
      t.string :activation_digest
      t.boolean :activated
      t.datetime :activate_at
      t.string :reset_digest
      t.datetime :reset_sent_at
      t.integer :role, default: [3]
      t.timestamps
    end
   
  end
end
