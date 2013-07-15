class RenameDescriptionInJobs < ActiveRecord::Migration
  def change
  	rename_column :jobs, :decription, :description
  end
end
