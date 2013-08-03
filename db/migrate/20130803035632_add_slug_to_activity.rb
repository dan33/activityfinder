class AddSlugToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :slug, :string
  end
end
