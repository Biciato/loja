class CreateProdutos < ActiveRecord::Migration[5.1]
  def change
    create_table :produtos do |t|
      t.string :titulo
      t.string :image_url
      t.decimal :preco, precision: 8, scale: 2

      t.timestamps
    end
  end
end
