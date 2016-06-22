class Memo < ActiveRecord::Base
  has_many :tagings
  has_many :labels, through: :tagings
end
