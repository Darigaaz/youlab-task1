class Counter < ActiveRecord::Base

  validates :to, presence: true
  validates :value, presence: true, numericality: true
end
