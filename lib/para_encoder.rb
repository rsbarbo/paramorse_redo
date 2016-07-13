require "pry"
require "./lib/encoder"

module ParaMorse
  class ParallelEncoder

    attr_reader :encoder

    def initialize
      @encoder = ParaMorse::Encoder.new
    end

    def encode(plain_text, nof, encoded_files)
      input = File.read(plain_text)
      output = encoder.encode(input)
      file_array = (0..(nof -1)).to_a
      if encoded_files.include?("*")
        file_array.each_with_index do |n, i|
          if i < 10
            File.write("output0#{n}.txt", output)
          else
            File.write("output#{n}.txt", output)
          end
        end
      else
        encoded_files
      end
    end

  end
end

  file_enc = ParaMorse::ParallelEncoder.new
  file_enc.encode("plain.txt", 11, "output*.txt")
