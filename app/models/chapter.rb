class Chapter < ApplicationRecord
  has_many :dbm_pages, dependent: :destroy
  validates :number, presence: true, numericality: { only_integer: true }

end
