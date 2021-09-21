class AddLatitudeAndLongitudeToDinosaur < ActiveRecord::Migration[6.1]
  def change
    add_column :dinosaurs, :latitude, :float
    add_column :dinosaurs, :longitude, :float
  end
end
