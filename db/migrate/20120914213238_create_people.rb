class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.date :birth_date
      t.string :gender
      t.references :disc

      t.timestamps
    end
    add_index :people, :disc_id
  end
end
