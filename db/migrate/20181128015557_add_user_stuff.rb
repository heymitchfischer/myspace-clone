class AddUserStuff < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :biography, :text
    add_column :users, :age, :integer
  end
end
