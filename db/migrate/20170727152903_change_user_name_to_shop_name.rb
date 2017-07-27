class ChangeUserNameToShopName < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :username, :shop_name
  end
end
