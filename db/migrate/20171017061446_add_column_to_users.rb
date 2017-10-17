class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change

    add_column :users, :verification, :integer, :default => 0, :null => false

  end
end
