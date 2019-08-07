class CreateBands < ActiveRecord::Migration[5.2]
  def change
    create_table :bands do |t|
      t.string :name, null: false
      t.index :name, name: :band_name
      t.timestamps
    end
  end
end
