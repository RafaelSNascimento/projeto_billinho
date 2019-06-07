class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.decimal :total, null: false
      t.date :expire_at, null: false
      t.references :matriculation, foreign_key: true, null: false
      t.text :status, null: false

      t.timestamps
    end
  end
end
