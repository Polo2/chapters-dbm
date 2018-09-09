class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.integer :num
      t.boolean :finished
      t.string :url

      t.timestamps
    end
  end
end
