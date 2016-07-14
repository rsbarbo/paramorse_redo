require "pry"
require "./lib/file_encoder"

module ParaMorse
  class ParallelEncoder
    attr_reader :file_encoder

    def initialize
      @file_encoder = ParaMorse::FileEncoder.new
    end

    def encode_from_file(input_file, nof = 0, output)
      file_encoder.encode(input_file, nof = 0, output)
    end

  end
end
