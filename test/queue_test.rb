require_relative 'helper_test'
require_relative '../lib/queue'

class QueueTest < Minitest::Test

  def test_it_can_count
    q = ParaMorse::Queue.new
    assert_equal 0, q.count
  end

  def test_it_can_push
    q = ParaMorse::Queue.new
    q.push('1')
    q.push('0')
    q.push('0')
    q.push('1')
    q.push('1')
    assert_equal 5, q.count
  end

  def test_it_can_tail
    q = ParaMorse::Queue.new
    q.push('1')
    q.push('0')
    q.push('0')
    q.push('1')
    q.push('1')
    assert_equal '1', q.tail
  end

  def test_it_can_tail_multiple_digits
    q = ParaMorse::Queue.new
    q.push('1')
    q.push('0')
    q.push('0')
    q.push('1')
    q.push('1')
    expected = ['1', '1', '0']
    assert_equal expected, q.tail(3)
  end

  def test_it_can_peek
    q = ParaMorse::Queue.new
    q.push('1')
    q.push('0')
    q.push('0')
    q.push('1')
    q.push('1')
    expected = '1'
    assert_equal expected, q.peek
  end

  def test_it_can_peek_multiple_digits
    q = ParaMorse::Queue.new
    q.push('1')
    q.push('0')
    q.push('0')
    q.push('1')
    q.push('1')
    expected = ['1', '0', '0']
    assert_equal expected, q.peek(3)
  end

  def test_it_can_pop_one
    q = ParaMorse::Queue.new
    q.push('1')
    q.push('0')
    q.push('0')
    q.push('1')
    q.push('1')
    assert_equal 5, q.count
    assert_equal "1", q.pop
    assert_equal 4, q.count
  end

  def test_it_can_pop_one
    q = ParaMorse::Queue.new
    q.push('1')
    q.push('0')
    q.push('0')
    q.push('1')
    q.push('1')
    q.pop
    assert_equal ['0', '0', '1'], q.pop(3)
    assert_equal 1, q.count
  end

  def test_pop_adjusts_count
    q = ParaMorse::Queue.new
    q.push('1')
    q.push('0')
    q.push('0')
    q.push('1')
    q.push('1')
    expected1 = 5
    expected2 = 1

    assert_equal expected1, q.count
    q.pop
    q.pop(3)
    assert_equal expected2, q.count
  end

  def test_it_can_clear
    q = ParaMorse::Queue.new
    q.push('1')
    q.push('0')
    q.push('0')
    q.push('1')
    q.push('1')
    expected1 = 5
    expected2 = 0

    assert_equal expected1, q.count
    q.clear
    assert_equal expected2, q.count
  end

end
