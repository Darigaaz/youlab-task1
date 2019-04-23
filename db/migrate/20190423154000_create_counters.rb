class CreateCounters < ActiveRecord::Migration[5.2]
  def change
    create_table :counters do |table|
      table.float :value

      table.date :from, null: false
      table.date :to, null: false
      table.timestamps null: false
    end
  end
end