class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :lastname
      t.string :cuit
      t.string :address

      t.timestamps
    end
  end
end
