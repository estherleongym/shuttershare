class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|

        t.references :user, foreign_key: true, index: true
        t.string :caption, null: false
        t.string :image, null: false

      t.timestamps
    end
  end
end
