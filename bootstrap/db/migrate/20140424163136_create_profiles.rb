class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :age
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
