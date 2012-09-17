class CreatePeople < ActiveRecord::Migration
  def up
    create_table :people do |t|
      t.string :name
      t.date :birth_date
      t.string :gender

      t.timestamps
    end
  end

  def down
    drop_table :people
  end
end
