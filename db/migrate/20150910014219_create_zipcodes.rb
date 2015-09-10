class CreateZipcodes < ActiveRecord::Migration
  def change
    create_table :zipcodes do |t|
      t.integer :zip
      t.string :city
      t.string :state
      t.decimal :lat, precision: 9, scale: 6
      t.decimal :long, precision: 9, scale: 6
      t.integer :timezone
      t.integer :dst

      t.timestamps null: false
    end
  end
end
