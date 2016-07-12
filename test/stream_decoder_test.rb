require_relative 'helper_test'
require "./lib/stream_decoder"
require "./lib/queue"
require "./lib/letter_decoder"


class StreamDecoderTest < Minitest::Test

  def test_can_receive_input
    stream = ParaMorse::StreamDecoder.new
    queue = ParaMorse::Queue.new
    stream.receive("0")
    assert_equal ["0"], stream.queue
  end

  def test_can_receive_multiple_inputs
    stream = ParaMorse::StreamDecoder.new
    queue = ParaMorse::Queue.new
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    result = ["1", "0", "1", "0", "1", "0", "1", "0", "0", "0", "1", "0", "1", "0"]
    assert_equal result, stream.queue
    assert_equal "Hi", stream.decode

  end

  def test_can_divide_words
    skip
    stream = ParaMorse::StreamDecoder.new
    stream.receive("1")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("1")
    stream.decode
    assert_equal [["1"], ["1"]], stream.words
  end

  def test_can_divide_letters
    skip
    stream = ParaMorse::StreamDecoder.new
    stream.receive("1")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("1")
    stream.decode
    assert_equal [["1", "1"]], stream.words
  end

  def test_can_decode_one_streamed_word
    skip
    stream = ParaMorse::StreamDecoder.new
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    assert_equal "HI", stream.decode
  end

  def test_can_decode_multiple_streamed_words
    skip
    stream = ParaMorse::StreamDecoder.new
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("1")
    assert_equal "HI HE", stream.decode
  end

end
