class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :description
      t.float :price_cost
      t.float :price
      t.float :price_card
      t.string :bar_code
      t.integer :category_id

      t.timestamps
    end
  end
end
