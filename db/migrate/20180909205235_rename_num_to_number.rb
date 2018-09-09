class RenameNumToNumber < ActiveRecord::Migration[5.2]
  def change
    rename_column :chapters, :num, :number
  end
end
