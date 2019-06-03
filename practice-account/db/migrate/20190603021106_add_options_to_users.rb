class AddOptionsToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column(:users, :name, :string, :limit => 25, null: false)
    change_column(:users, :email, :string, :limit => 250, null: false)
  end
end
