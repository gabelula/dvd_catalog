class AddTypeToPerson < ActiveRecord::Migration
  def up
    add_column :people, :type, :string
  end

  def down
    remove_column :people, :type
  end
end
