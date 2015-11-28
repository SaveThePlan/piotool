class AddDatetimesToFavorites < ActiveRecord::Migration
  def change
    add_column(:favorites, :created_at, :datetime, null: false)
    add_column(:favorites, :updated_at, :datetime, null: false)
  end
end
