class ChangeNumOfEmployeesInCompanies < ActiveRecord::Migration
  def change
    change_column :companies, :number_of_employees, :string
  end
end
