class AddLogoUrlToUser < ActiveRecord::Migration
  def change
    add_column :users, :logo_url, :string
  end
end
