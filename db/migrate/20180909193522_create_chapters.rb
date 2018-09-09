class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.integer :num
      t.boolean :finished, default: false
      t.string :url
      t.timestamps
    end

    change_column_null :chapters, :finished, false, false
  end
end
