class AddFieldsToChapterAndPage < ActiveRecord::Migration[5.2]
  def change
    rename_column :chapters, :url, :img_url
    add_column :chapters, :title, :string
  end
end
