class ChangeDataTypeForFieldname < ActiveRecord::Migration[5.2]
  def change
    change_column(:students, :gender, :text, :limit => 1)
    change_column(:students, :telephone, :int8)
  end
end
