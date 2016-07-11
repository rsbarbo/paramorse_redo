require_relative 'test_helper'
require_relative '../lib/queue'

class QueueTest < Minitest::Test
  def test_it_can_count
    q = Queue.new

    expected = 0
    actual = q.count

    assert_equal expected, actual
  end

  def test_it_can_push
    q = Queue.new
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
    q = Queue.new
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
    q = Queue.new
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
    q = Queue.new
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
    q = Queue.new
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
    q = Queue.new
    q.push('1')
    q.push('0')
    q.push('0')
    q.push('1')
    q.push('1')

    expected = '1'
    actual = q.pop_by_another_name

    assert_equal expected, actual
  end

  def test_it_can_pop
    q = Queue.new
    q.push('1')
    q.push('0')
    q.push('0')
    q.push('1')
    q.push('1')
    expected1 = "1"
    expected2 = ['0', '0', '1']

    actual1 = q.pop_by_another_name
    actual2 = q.pop_by_another_name(3)

    assert_equal expected1, actual1
    assert_equal expected2, actual2
  end

  def test_pop_adjusts_count
    q = Queue.new
    q.push('1')
    q.push('0')
    q.push('0')
    q.push('1')
    q.push('1')
    expected1 = 5
    expected2 = 1

    actual1 = q.count
    q.pop_by_another_name
    q.pop_by_another_name(3)
    actual2 = q.count

    assert_equal expected1, actual1
    assert_equal expected2, actual2
  end

  def test_it_can_clear
    q = Queue.new
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
