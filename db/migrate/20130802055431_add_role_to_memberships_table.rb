class AddRoleToMembershipsTable < ActiveRecord::Migration
  def change
    add_column :memberships, :role, :string, :default => 'member'
  end
end
