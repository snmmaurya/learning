class CreateAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :type # STI
      t.timestamps
    end
    add_index :animals, :type
  end
end