class CreateGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :passport_no
      t.string :phone

      t.timestamps
    end
  end
end
