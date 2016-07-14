require "minitest/autorun"
require "minitest/pride"
require "./lib/file_decoder"

class FileDecoderTest < Minitest::Test

  def test_read_file
    file_enc = ParaMorse::FileDecoder.new
    assert_equal "EEESEEEEEEESESSEEEEESEE", file_enc.decode(1, "test/test_2.txt", "test/test_1.txt")
  end

end
