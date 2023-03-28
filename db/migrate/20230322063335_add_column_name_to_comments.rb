class AddColumnNameToComments < ActiveRecord::Migration[7.0]
  def change
  	add_column :comments, :reply, :string
  end
end
