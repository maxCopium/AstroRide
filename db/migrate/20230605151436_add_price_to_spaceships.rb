class AddPriceToSpaceships < ActiveRecord::Migration[7.0]
  def change
    add_column :spaceships, :price, :float
  end
end
