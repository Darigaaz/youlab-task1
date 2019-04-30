require File.expand_path(
    '../../test_helper',
    __FILE__
)

class CounterTest < ActiveSupport::TestCase
  test 'сохраняется в базу при передаче правивильных параметров' do
    assert_equal true, Counter.new(to: '21.02.19', value: 13).save
  end

  test 'не сохраняется в базу при отсутствии параметра to' do
    assert_equal false, Counter.new(value: 14).save
  end

  test 'не сохраняется в базу при отсутствии параметра value' do
    assert_equal false, Counter.new(to: Date.new(1,2,12)).save
  end

  test 'не сохраняется в базу при передаче нечисл1ового value' do
    assert_equal false, Counter.new(to: Date.new(1,2,3), value: 'qwerty').save
  end
end