class CreateSnmUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :snm_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number,       null: false, default: ""
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.integer  :sign_in_count, default: 0, null: false
      t.boolean :locked, default: false
      t.timestamp :locked_at
      t.string :locked_description
      t.integer :status
      t.integer :user_informations_count # counter_cache: true
      t.timestamps
    end
    add_index :snm_users, :email
    add_index :snm_users, :phone_number
  end
end