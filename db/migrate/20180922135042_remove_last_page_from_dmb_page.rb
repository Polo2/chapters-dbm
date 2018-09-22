class RemoveLastPageFromDmbPage < ActiveRecord::Migration[5.2]
  def up
    remove_column :dbm_pages, :first_page
  end

  def down
    add_column :dbm_pages, :first_page, :boolean, default: false
  end
end
