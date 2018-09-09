class AddReferenceToDbmPage < ActiveRecord::Migration[5.2]
  def change
    add_reference :dbm_pages, :chapter, foreign_key: true
  end
end
