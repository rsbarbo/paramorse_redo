require "minitest/autorun"
require "minitest/pride"
require "./lib/file_decoder"

class FileDecoderTest < Minitest::Test

  def test_read_file
    file_enc = ParaMorse::FileDecoder.new
    assert_equal 10, file_enc.decode("test/test_2.txt", "test/test_1.txt")
  end

end
