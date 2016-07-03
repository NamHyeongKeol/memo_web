class Label < ActiveRecord::Base
  has_many :tagings
  has_many :memos, through: :tagings
  validates :name, presence: true
end
