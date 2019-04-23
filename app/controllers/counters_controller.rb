class CountersController < ApplicationController
  def index
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

  private

  def params_counter
    params.
      require(:counter).
      permit(:value, :to)
  end
end
