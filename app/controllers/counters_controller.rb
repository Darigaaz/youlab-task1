class CountersController < ApplicationController
  def index
  end

  def new
    counter = Counter.new

    render locals: {counter: counter}
  end
end
