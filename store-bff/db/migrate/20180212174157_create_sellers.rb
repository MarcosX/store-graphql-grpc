class CreateSellers < ActiveRecord::Migration[5.1]
  def change
    create_table :sellers do |t|

      t.string :name

      t.timestamps
    end
  end
end
