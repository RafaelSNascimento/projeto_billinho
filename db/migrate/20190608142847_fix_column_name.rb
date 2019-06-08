class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column(:institutions, :type, :is_type)
  end
end
