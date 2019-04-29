# frozen_string_literal: true

class CountersQuery < Query
  self.queried_class = Counter

  self.available_columns = [
    QueryColumn.new(:id,
                    sortable: %Q(#{Counter.quoted_table_name}."id"),
                    caption: 'ID'),
    QueryColumn.new(:to,
                    sortable: %Q(#{Counter.quoted_table_name}."to"),
                    caption: 'Число'),
    QueryColumn.new(:value,
                    sortable: %Q(#{Counter.quoted_table_name}."value"),
                    caption: 'Значение')
  ]

  def initialize_available_filters
    add_available_filter 'id',
                         type: :list,
                         name: 'ID',
                         values: lambda {
                           Counter.all.pluck(:id).map{ |id| [id, id.to_s] }
                         }

    add_available_filter 'to',
                         type: :date,
                         name: 'Число'

    add_available_filter 'value',
                         type: :list,
                         name: 'Значение',
                         values: lambda {
                           Counter.all.distinct.pluck(:value).map { |val| [val, val.to_s] }
                         }
  end

  def initialize(attrs = nil, *args)
    super
    self.filters ||= {}
  end

  def base_scope
    order_option = [group_by_sort_order, (options[:order] || sort_clause)].flatten.reject(&:blank?)

    Counter.
        order(order_option).
        joins(joins_for_order_statement(order_option.join(','))).
        where(statement)
  end

  def default_columns_names
    %i[id to value]
  end

  def sql_for_to_field(field, operator, value, **_options)
    sql_for_field(field, operator, value, Counter.quoted_table_name, %("to"))
  end
end
