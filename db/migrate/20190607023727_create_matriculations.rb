class CreateMatriculations < ActiveRecord::Migration[5.2]
  def change
    create_table :matriculations do |t|
      t.decimal :total, null: false
      t.integer :invoice, null: false
      t.integer :invoice_expire_at, null: false
      t.text :course_name, null: false
      t.references :institution, foreign_key: true, null: false
      t.references :student, foreign_key: true, null: false

      t.timestamps
    end
  end
end
