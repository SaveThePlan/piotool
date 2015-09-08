class RemoveContactFromNotes < ActiveRecord::Migration
  def change
    remove_reference :notes, :contact, index: true, foreign_key: true
  end
end
