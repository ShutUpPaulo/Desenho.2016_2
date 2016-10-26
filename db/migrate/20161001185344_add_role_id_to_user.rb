# Add field in table User for tracking its role
class AddRoleIdToUser < ActiveRecord::Migration
  def change
    add_reference :users, :role, index: true, foreign_key: true
  end
end
