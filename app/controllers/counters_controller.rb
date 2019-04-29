# frozen_string_literal: true

class CountersController < ApplicationController
  helper :queries
  include QueriesHelper

  helper :counters_column_value

  def index
    retrieve_time_entry_query

    @entry_count = @query.base_scope.count
    @entry_pages = Paginator.new @entry_count, per_page_option, params['page']
    @entries = @query.base_scope.offset(@entry_pages.offset).limit(@entry_pages.per_page).to_a
  end

  def new
    counter = Counter.new

    render locals: {counter: counter}
  end

  def create
    counter = Counter.new
    if !counter.update(params_counter)
      render :new,
             locals: {counter: counter}
    else
      redirect_to counter_path(counter)
    end
  end

  def show
    counter = Counter.find(params[:id])
    render locals: {counter: counter}
  end

  def edit
    counter = Counter.find(params[:id])
    render locals: {counter: counter}
  end

  def update
    counter = Counter.find(params[:id])
    if !counter.update(params_counter)
      render :edit,
             locals: {counter: counter}
    else
      redirect_to counter_path(counter)
    end
  end

  private

  def params_counter
    params.
      require(:counter).
      permit(:value, :to)
  end

  def retrieve_time_entry_query
    retrieve_query(CountersQuery)
  end
end
