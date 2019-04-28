# frozen_string_literal: true

class CountersQuery < Query
  self.queried_class = Counter

  self.available_columns = [
    QueryColumn.new(:id,
                    sortable: "#{Counter.table_name}.id",
                    caption: 'ID'),
    QueryColumn.new(:to,
                    sortable: "#{Counter.table_name}.to",
                    caption: 'Число'),
    QueryColumn.new(:value,
                    sortable: "#{Counter.table_name}.value",
                    caption: 'Значение')
  ]

  def initialize_available_filters
    add_available_filter 'id',
                         type: :list,
                         name: 'ID',
                         values: lambda {
                           Counter.all.map { |counter| [counter.id, counter.id.to_s] }
                         }

    add_available_filter 'to',
                         type: :date,
                         name: 'Число',
                         values: lambda {
                           Counter.all.map { |counter| [counter.to, counter.id.to_s] }
                         }

    add_available_filter 'value',
                         type: :list,
                         name: 'Значение',
                         values: lambda {
                           Counter.all.map { |counter| [counter.value, counter.id.to_s] }
                         }
  end

  def initialize(attrs = nil, *args)
    super
    self.filters ||= {}
  end

  def base_scope
    Counter.where(statement)
  end

  def default_columns_names
    %i[id to value]
  end
end
