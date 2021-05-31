class CreateWatches < ActiveRecord::Migration[6.0]
  def change
    create_table :watches do |t|
      t.string :name
      t.string :brand
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
