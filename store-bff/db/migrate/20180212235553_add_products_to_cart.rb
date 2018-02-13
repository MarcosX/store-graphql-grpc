class AddProductsToCart < ActiveRecord::Migration[5.1]
  def change
    create_table :products_to_carts do |t|
      t.belongs_to :product
      t.belongs_to :cart

      t.timestamps
    end
  end
end
