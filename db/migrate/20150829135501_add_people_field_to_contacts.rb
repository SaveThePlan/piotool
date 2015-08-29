class AddPeopleFieldToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :mobile, :string
    add_column :contacts, :job, :string
  end
end
