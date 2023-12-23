class RenamePostCordToPostCodeInCustomer < ActiveRecord::Migration[6.1]
  def change
    rename_column :customers, :post_cord, :post_code
  end
end
