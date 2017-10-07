class CreateLinhaItems < ActiveRecord::Migration[5.1]
  def change
    create_table :linha_items do |t|
      t.references :produto, foreign_key: true
      t.belongs_to :carrinho, foreign_key: true

      t.timestamps
    end
  end
end
