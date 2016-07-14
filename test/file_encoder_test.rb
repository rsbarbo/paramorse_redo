require "minitest/autorun"
require "minitest/pride"
require "./lib/file_encoder"

class FileEncoderTest < Minitest::Test

  def test_read_file
    file_enc = ParaMorse::FileEncoder.new
    result = "11101110001011101000000010111011101000101110100010001010100010100011101010001000111010001110000000101110001110100011101010000000111011100010111010001010100000001110101010001010111000101010001010101000000011101110001110101110111000000010101110100010111010001010001000111010001110101000000011100010101010001000000010101011100010100011101011101000100000001011101110100010111010001000101010001010001110101000100011101000111000000010111000111010001110101000000011101010001011101000000011101010100010100011101010001000111010000000111011100010111000111010111011100011101110111000101110100000001011101000101110001011101110001011101010001010001110100011101110100010101000000011101011101000101010100010100010001010111010000000101010001011101110100010100010111010100010111010100010001011101000000011101011101000101110101000100010111010001110111010001110101110111000000011101110001000111011100011101010100010001011101000101010000000111011101110001010111010000000111010111010001110111011100011101000111011101000101110100010001010100010101"
    assert_equal result.length, file_enc.encode("test/test_1.txt", "test/test_2.txt")
  end

  def test_create_new_files
    file_enc = ParaMorse::FileEncoder.new
    assert_equal [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10],file_enc.encode("test/test_1.txt",11, "test/test_2*.txt")
  end


end
