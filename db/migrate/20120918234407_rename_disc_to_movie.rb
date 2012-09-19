class RenameDiscToMovie < ActiveRecord::Migration
  def up
    rename_table :discs, :movies
  end

  def down
    rename_table :movies, :discs
  end
end
