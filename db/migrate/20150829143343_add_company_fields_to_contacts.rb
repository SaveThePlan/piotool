class AddCompanyFieldsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :siret, :string
    add_column :contacts, :tva, :string
    add_column :contacts, :employees_count, :integer
  end
end
