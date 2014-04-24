class RemoveFieldToPost < ActiveRecord::Migration
  def change
    remove_column :posts, :name, :string
    remove_column :posts, :age, :integer
  end
end
