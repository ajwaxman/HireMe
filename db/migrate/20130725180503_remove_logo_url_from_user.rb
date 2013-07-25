class RemoveLogoUrlFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :logo_url
  end

  def down
    add_column :users, :logo_url, :string
  end
end
