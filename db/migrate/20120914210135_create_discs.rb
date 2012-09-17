class CreateDiscs < ActiveRecord::Migration
  def up
    create_table :discs do |t|
      t.string  :name
      t.date    :release_date
      t.text    :summary
      t.string  :asin
      t.integer :director_id

      t.timestamps
    end

#    add_index "discs", ["director_id"], :name => "index_discs_on_person_id"
  end

  def down
    drop_table :discs
  end
end
