class CreateSpaceships < ActiveRecord::Migration[7.0]
  def change
    create_table :spaceships do |t|
      t.string :name
      t.string :category
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
