class AddQuantidadeToLinhaItems < ActiveRecord::Migration[5.1]
  def change
    add_column :linha_items, :quantidade, :integer, default: 1
  end
end
