class CreateWishitems < ActiveRecord::Migration[7.0]
  def change
    create_table :wishitems do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.string :link
      t.string :image_id
      t.boolean :sponsored

      t.timestamps
    end
  end
end
