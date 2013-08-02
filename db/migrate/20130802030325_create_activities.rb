class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.string :description
      t.string :address
      t.float :longitude
      t.float :latitude
      t.integer :category_id

      t.timestamps
    end
  end
end
