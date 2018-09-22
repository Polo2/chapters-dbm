class Chapter < ApplicationRecord
  has_many :dbm_pages, dependent: :destroy
  validates :number, presence: true, numericality: { only_integer: true }

  def button_link
    is_finished? ? pages.first.url : "#"
  end

  def button_text
    is_finished? ? "GO!" : "..."
  end

  def self.last_chapter
    self.all.sort_by{ |c| c.number }.last
  end

  def pages
    dbm_pages.sort_by{ |p| p.number }
  end

  def is_finished?
    finished
  end
end
