require "pry"
require "./lib/file_encoder"

module ParaMorse
  class ParallelEncoder
    attr_reader :file_encoder

    def initialize
      @file_encoder = ParaMorse::FileEncoder.new
    end

    def encode_from_file(input_file, nof, output)
      file_encoder.encode(input_file, nof, output)
    end
    
  end
end

# parallel_encoder = ParaMorse::ParallelEncoder.new
# parallel_encoder.encode_from_file('input.txt', 8, 'output*.txt')
