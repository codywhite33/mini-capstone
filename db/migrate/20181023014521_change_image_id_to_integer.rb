class ChangeImageIdToInteger < ActiveRecord::Migration[5.2]
  def change
    #actually removing product_id column
    remove_column :images, :product_id, :string
  end
end
