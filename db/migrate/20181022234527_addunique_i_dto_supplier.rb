class AdduniqueIDtoSupplier < ActiveRecord::Migration[5.2]
  def change
    add_column :suppliers, :uid, :integer
  end
end
