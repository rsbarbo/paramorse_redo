require_relative 'helper_test'
require_relative '../lib/queue'

class QueueTest < Minitest::Test

  def test_it_can_count
    q = ParaMorse::Queue.new
    assert_equal 0, q.count
  end

  def test_it_can_push
    skip
    q = ParaMorse::Queue.new
    q.push('1')
    q.push('0')
    q.push('0')
    q.push('1')
    q.push('1')

    expected = 5
    actual = q.count

    assert_equal expected, actual
  end

  def test_it_can_tail
    skip
    q = ParaMorse::Queue.new
    q.push('1')
    q.push('0')
    q.push('0')
    q.push('1')
    q.push('1')

    expected = '1'
    actual = q.tail

    assert_equal expected, actual
  end

  def test_it_can_tail_multiple_digits
    skip
    q = ParaMorse::Queue.new
    q.push('1')
    q.push('0')
    q.push('0')
    q.push('1')
    q.push('1')

    expected = ['1', '1', '0']
    actual = q.tail(3)

    assert_equal expected, actual
  end

  def test_it_can_peek
    skip
    q = ParaMorse::Queue.new
    q.push('1')
    q.push('0')
    q.push('0')
    q.push('1')
    q.push('1')

    expected = '1'
    actual = q.peek

    assert_equal expected, actual
  end

  def test_it_can_peek_multiple_digits
    skip
    q = ParaMorse::Queue.new
    q.push('1')
    q.push('0')
    q.push('0')
    q.push('1')
    q.push('1')

    expected = ['1', '0', '0']
    actual = q.peek(3)

    assert_equal expected, actual
  end

  def test_it_can_pop
    skip
    q = ParaMorse::Queue.new
    q.push('1')
    q.push('0')
    q.push('0')
    q.push('1')
    q.push('1')

    expected = '1'
    actual = q.pop

    assert_equal expected, actual
  end

  def test_it_can_pop
    skip
    q = ParaMorse::Queue.new
    q.push('1')
    q.push('0')
    q.push('0')
    q.push('1')
    q.push('1')
    expected1 = "1"
    expected2 = ['0', '0', '1']

    actual1 = q.pop
    actual2 = q.pop(3)

    assert_equal expected1, actual1
    assert_equal expected2, actual2
  end

  def test_pop_adjusts_count
    skip
    q = ParaMorse::Queue.new
    q.push('1')
    q.push('0')
    q.push('0')
    q.push('1')
    q.push('1')
    expected1 = 5
    expected2 = 1

    actual1 = q.count
    q.pop
    q.pop(3)
    actual2 = q.count

    assert_equal expected1, actual1
    assert_equal expected2, actual2
  end

  def test_it_can_clear
    skip
    q = ParaMorse::Queue.new
    q.push('1')
    q.push('0')
    q.push('0')
    q.push('1')
    q.push('1')
    expected1 = 5
    expected2 = 0

    actual1 = q.count
    q.clear
    actual2 = q.count

    assert_equal expected1, actual1
    assert_equal expected2, actual2
  end

end
