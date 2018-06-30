class CreatePointOfInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :point_of_interests do |t|
      t.string :name, null: false, index: { unique: true }
      t.integer :x, null: false, index: true
      t.integer :y, null: false, index: true

      t.timestamps
    end
  end
end
