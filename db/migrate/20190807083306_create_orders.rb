class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.timestamps

      t.string :item_title, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone
      t.text :note
    end
  end
end
