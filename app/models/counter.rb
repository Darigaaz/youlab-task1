class Counter < ActiveRecord::Base
  validates :to, presence: true, date: true
  validates :value, presence: true, numericality: true
end
