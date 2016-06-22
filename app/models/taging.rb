class Taging < ActiveRecord::Base
  belongs_to :label
  belongs_to :memo
end
