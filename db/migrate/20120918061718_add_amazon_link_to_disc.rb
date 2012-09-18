class AddAmazonLinkToDisc < ActiveRecord::Migration
  def up
    add_column :discs, :amazon_link, :string
  end

  def down
    remove_column :discs, :amazon_link
  end
end
