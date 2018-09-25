class DbmPage < ApplicationRecord
  belongs_to :chapter


  def self.last_page
    self.all.sort_by{ |p| p.number }.last
  end
end
