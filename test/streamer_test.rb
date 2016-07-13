require './test/helper_test'
require "./lib/streamer"
require "./lib/queue"
require "./lib/letter_decoder"
require "./lib/letter_encoder"


class StreamerTest < Minitest::Test

  def test_can_receive_input
    stream = ParaMorse::Streamer.new
    queue = ParaMorse::Queue.new
    stream.receive("0")
    assert_equal ["0"], stream.queue
  end

  def test_can_receive_multiple_inputs
    stream = ParaMorse::Streamer.new
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
    stream = ParaMorse::Streamer.new
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
    stream = ParaMorse::Streamer.new
    stream.receive("1")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("1")
    assert_equal "EE",stream.decode
  end

  def test_can_decode_one_streamed_word
    stream = ParaMorse::Streamer.new
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
    stream = ParaMorse::Streamer.new
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

  def test_raise_error_message_while_trying_decode_english
    stream = ParaMorse::Streamer.new
    stream.receive("A")
    stream.receive("B")
    stream.receive("C")
    assert_equal "Please make sure your input is binary numbers", stream.decode
  end

  def test_raise_error_message_while_trying_encode_binary_numbers
    stream = ParaMorse::Streamer.new
    stream.receive("1")
    stream.receive("0")
    stream.receive("0")
    assert_equal "Please make sure your input is english like", stream.encode
  end

  def test_encode_streamed_letters
    stream = ParaMorse::Streamer.new
    stream.receive("l")
    stream.receive("o")
    stream.receive("v")
    stream.receive("e")
    outcome = "101110101000111011101110001010101110001"
    assert_equal outcome, stream.encode
  end

end
