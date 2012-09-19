class RenameActsToRoles < ActiveRecord::Migration
  def up
    rename_table :acts, :roles
  end

  def down
    rename_table :roles, :acts
  end
end
