class AddHireableToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hireable, :boolean
  end
end
