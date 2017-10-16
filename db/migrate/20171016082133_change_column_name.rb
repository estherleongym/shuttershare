class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change

     rename_column :photos, :image, :photo

  end
end
