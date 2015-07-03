class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :phone
      t.string :website

      t.timestamps null: false
    end
  end
end
