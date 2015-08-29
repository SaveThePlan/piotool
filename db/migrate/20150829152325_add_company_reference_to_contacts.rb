class AddCompanyReferenceToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :company_id, :integer
    add_index :contacts, :company_id
    add_foreign_key :contacts, :contacts, column: :company_id
  end
end
