class Memo < ActiveRecord::Base
  has_many :tagings
  has_many :labels, through: :tagings
  validates :title, presence: true
  validates :content, presence: true
end
