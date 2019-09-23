class CreateSnmUserInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :snm_user_informations do |t|
      t.integer :source, default: 0
      t.references :user, index: true
      t.timestamps
    end
  end
end