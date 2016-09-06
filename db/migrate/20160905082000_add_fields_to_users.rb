# Custom users attributes
class AddFieldsToUsers < ActiveRecord::Migration
  def change
    # Personal information
    add_column :users, :firstname, :string, null: false, default: ''
    add_column :users, :lastname,  :string, null: false, default: ''
    add_column :users, :username,  :string, null: false, default: ''
  end
end
