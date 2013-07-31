class AddInfoToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :crunchbase_url, :string
    add_column :companies, :blog_url, :string
    add_column :companies, :twitter_username, :string
    add_column :companies, :number_of_employees, :integer
    add_column :companies, :founded_year, :integer
    add_column :companies, :overview, :text
  end
end
