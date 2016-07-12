require "minitest/autorun"
require "minitest/pride"
require "./lib/file_encoder"

class FileEncoderTest < Minitest::Test

  def test_read_file
    file_enc = ParaMorse::FileEncoder.new
    assert_equal 107, file_enc.encode("test/test_1.txt", "test/test_2.txt")
  end


end
