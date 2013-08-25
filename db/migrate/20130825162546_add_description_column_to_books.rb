class AddDescriptionColumnToBooks < ActiveRecord::Migration
  def change
  	add_column :books, :description, :string
  end
end
