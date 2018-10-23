class RemoveUiDfromSupplier < ActiveRecord::Migration[5.2]
  def change
    remove_column :suppliers, :uid, :integer
  end
end
