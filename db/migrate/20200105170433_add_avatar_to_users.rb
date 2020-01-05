class AddAvatarToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :avatar_file, :text
    add_column :users, :avatar_url, :string
  end
end
