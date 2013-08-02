class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :description
      t.integer :user_id
      t.integer :activity_id

      t.timestamps
    end
  end
end
