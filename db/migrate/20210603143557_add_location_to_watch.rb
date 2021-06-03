class AddLocationToWatch < ActiveRecord::Migration[6.0]
  def change
    add_column :watches, :postcode, :string
    add_column :watches, :latitude, :float
    add_column :watches, :longitude, :float
  end
end
