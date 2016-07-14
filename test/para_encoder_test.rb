require "./test/helper_test"
require "./lib/para_encoder"

class ParallelEncoderTest < Minitest::Test

  def test_something
    parallel_encoder = ParaMorse::ParallelEncoder.new
    assert_equal [0, 1, 2, 3, 4, 5, 6, 7], parallel_encoder.encode_from_file('input.txt', 8, 'output*.txt')
  end


end
