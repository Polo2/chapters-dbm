class CreateDbmPages < ActiveRecord::Migration[5.2]
  def change
    create_table :dbm_pages do |t|
      t.integer :number
      t.string :url
      t.boolean :first_page, default: false

      t.timestamps
    end

    change_column_null :dbm_pages, :first_page, false, false
  end
end
