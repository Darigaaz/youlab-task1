class DelToColumnOnCounters < ActiveRecord::Migration[5.2]
  def change
    change_table :counters do |table|
      table.remove :from, :date, null: false
    end
  end
end