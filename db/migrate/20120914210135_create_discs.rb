class CreateDiscs < ActiveRecord::Migration
  def change
    create_table :discs do |t|
      t.string :name
      t.date :release_date
      t.text :summary
      t.string :asin

      t.timestamps
    end
  end
end
