class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.text :name, null: false
      t.text :cpf, null: false
      t.date :dt_birth
      t.integer :telephone
      t.text :gender, null: false
      t.text :payment_type, null: false

      t.timestamps
    end
    add_index :students, :name, unique: true
    add_index :students, :cpf, unique: true
  end
end
