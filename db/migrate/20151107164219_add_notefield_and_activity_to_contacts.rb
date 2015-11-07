class AddNotefieldAndActivityToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :notefield, :text
    add_column :contacts, :activity, :string
  end
end
