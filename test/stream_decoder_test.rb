require_relative 'helper_test'
require "./lib/stream_decoder"
require "./lib/queue"
require "./lib/letter_decoder"
require "./lib/paramorse"


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
    assert_equal "HI", stream.decode

  end

  def test_can_divide_words
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
    assert_equal "E E", stream.decode
  end

  def test_can_divide_letters
    stream = ParaMorse::StreamDecoder.new
    stream.receive("1")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("1")
    assert_equal "EE",stream.decode
  end

  def test_can_decode_one_streamed_word
    stream = ParaMorse::StreamDecoder.new
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
    stream.receive("0")
    stream.receive("1")
    assert_equal "HI", stream.decode
  end

  def test_can_decode_multiple_streamed_words
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
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    assert_equal "HI SHE", stream.decode
  end

end
