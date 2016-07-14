require "./test/helper_test"
require "./lib/para_decoder"

class ParallelDecoderTest < Minitest::Test

  def test_something
    parallel_decoder = ParaMorse::ParallelDecoder.new
    assert_equal 0, parallel_decoder.decode_from_file(1,'input.txt', 'output*.txt')
  end


end
