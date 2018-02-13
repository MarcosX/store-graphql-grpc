class CreateCheckouts < ActiveRecord::Migration[5.1]
  def change
    create_table :checkouts do |t|
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
