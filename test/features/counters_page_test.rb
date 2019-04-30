require File.expand_path('../../test_helper', __FILE__)

class CounterListTest < Capybara::Rails::TestCase
  test "отображает все записи" do
    Counter.create!(to: Date.new(1,2,12), value: 123)
    Counter.create!(to: Date.new(1,2,12), value: 567)

    visit counters_path
    page.must_have_content "123"
    page.must_have_content "567"
  end
end
