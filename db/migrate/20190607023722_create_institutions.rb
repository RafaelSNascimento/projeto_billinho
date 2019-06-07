class CreateInstitutions < ActiveRecord::Migration[5.2]
  def change
    create_table :institutions do |t|
      t.text :name, null: false
      t.text :cnpj, null: false
      t.text :type, null: false

      t.timestamps
    end
    add_index :institutions, :name, unique: true
    add_index :institutions, :cnpj, unique: true
  end
end
