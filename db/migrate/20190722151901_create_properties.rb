class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :price
      t.string :address
      t.integer :age
      t.text :remarks

      t.timestamps
    end
  end
end