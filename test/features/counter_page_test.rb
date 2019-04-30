require File.expand_path('../../test_helper', __FILE__)

class CounterPageTest < Capybara::Rails::TestCase
  test "отображает значение счетчика" do
    counter = Counter.create(to: Date.new(1,2,13),
                             value: 31337)

    visit counter_path(counter)
    page.must_have_content '31337'
  end

  test "отображает дату снятия показания счетчика" do
    counter = Counter.create(to: Date.new(2012,04,30),
                             value: 31337)

    visit counter_path(counter)
    page.must_have_content '30.04.12'
  end
end
