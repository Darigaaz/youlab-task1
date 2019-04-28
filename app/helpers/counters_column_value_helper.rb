# frozen_string_literal: true

module CountersColumnValueHelper
  include ApplicationHelper

  def column_value(column, item, value)
    case column.name
    when :id
      link_to value, counter_path(item)
    else
      super
    end
  end
end
