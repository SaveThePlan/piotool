class RemoveKindFromNotes < ActiveRecord::Migration
  def change
    remove_column :notes, :kind, :string
  end
end
