require "minitest/autorun"
require "minitest/pride"
require "./lib/file_encoder"

class FileEncoderTest < Minitest::Test

  def test_read_file
    file_enc = ParaMorse::FileEncoder.new
    result = "101010100010001011101010001011101010001110111011100000001011101110001110111011100010111010001011101010001110101"
    assert_equal result.length, file_enc.encode("test/test_1.txt", "test/test_2.txt")
  end

  def test_create_new_files
    file_enc = ParaMorse::FileEncoder.new
    assert_equal [0, 1, 2, 3, 4, 5, 6, 7],file_enc.encode("test/test_1.txt",8, "test/test_2*.txt")
  end

end
