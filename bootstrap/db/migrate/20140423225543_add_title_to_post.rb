class AddTitleToPost < ActiveRecord::Migration
  def change
    add_column :posts, :blog, :text
  end
end
