class ChangeFoundedYearInCompanies < ActiveRecord::Migration
  def change
    change_column :companies, :founded_year, :string
  end
end
