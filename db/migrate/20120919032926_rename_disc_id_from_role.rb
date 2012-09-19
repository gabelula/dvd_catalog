class RenameDiscIdFromRole < ActiveRecord::Migration
  def up
    rename_column :roles, :disc_id, :movie_id
  end

  def down
    rename_column :roles, :movie_id, :disc_id
  end
end
