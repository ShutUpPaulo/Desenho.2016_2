# Custom users attributes
class AddFieldsToUsers < ActiveRecord::Migration
  def change
    # Personal information
    add_column :users, :first_name, :string, null: false, default: ''
    add_column :users, :last_name, :string, null: false, default: ''
    add_column :users, :username, :string, null: false, default: ''
  end
end
