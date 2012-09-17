class AddActsTable < ActiveRecord::Migration
  def up
    create_table :acts do |t|
      t.integer :actor_id
      t.integer :disc_id
    end
  end

  def down
    drop_table :acts
  end
end
